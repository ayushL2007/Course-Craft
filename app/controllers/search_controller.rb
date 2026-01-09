require "ruby_llm"

class SearchController < ApplicationController
  @response = {}
  before_action :authenticate, only: [:enroll]
    def search
    end

    def result
      @query = query(params[:topic], params[:startLevel], params[:endLevel])
      @response = { Openai: prompt_openai(@query), gemini: prompt_gemini(@query) }
      @response.each do |k, v|
        begin
          @response[k] = JSON.parse(v.gsub("json", ""))
        rescue => e
          p "Error"
          @response.delete k
          next
        end
      end
      @detail = params[:topic]
      @cache_key = Time.current.to_s + "_key"
      Rails.cache.write(@cache_key, @response, expires_in: 30.minutes)
      flash[:topic] = params[:topic]
    end

    def enroll
      model = params[:model]

      @response = Rails.cache.read(params[:cache_key])
      @response = @response.select { |k, v| k.to_s==model } [model.to_sym]

      @path = Path.new(title: flash[:topic], description: @response["summary"])
      @path_info = PathInfo.new(extended_desc: @response["summary"])
      @path_info.path = @path

      @courses = @response.select { |k, v| k.to_s.include?("course") }
      p @courses.to_s
      @roadmap = Roadmap.new
      @courses.each do |key, value|
        @roadmap[key.to_sym] = value
        @roadmap[key.sub("course", "rating").to_sym] = 0
      end

      @path.path_info = @roadmap.path_info = @path_info
      @path.user = User.find_by(username: session[:username])

      if @roadmap.save && @path_info.save && @path.save
        @id = @roadmap.id
        redirect_to @path
      else
        redirect_to root_path
      end
    end

    private
    def query(topic, startLevel, endLevel)
      "
        Generate me a clear roadmap with course name, course link, average duration required to complete each course.
        Topic: #{topic} starting level: #{startLevel} and end level: #{endLevel}.
        The reply shouldn't contain anything extra.
        The entire roadmap should be less than 5 courses total.
        Total duration of roadmap should be less than 150 hrs.
        Also provide a comprehensive summary of all the within 500 words of the roadmap and what to expect.
        Format of reply:
        {
          \"course_one\": {\"name\": ..., \"link\": ..., \"duration\" ...}
          .
          .
          .
          \"summary\": \"...\"
          \"error\": \"error if any present else leave empty\"
        }
      "
    end

    private
    def prompt_gemini(query)
      model = RubyLLM.chat(provider: :gemini, model: 'gemini-2.5-flash-lite')
      @response = model.ask(query).content
      @response = @response.gsub("```", "")
    end

    private
    def prompt_openai(query)
      model = RubyLLM.chat(model: 'gpt-4o-mini')
      @response = model.ask(query).content
      p @response
      @response = @response.gsub("```", "")
    end

    private
    def expect_param
      params
            .expect(:roadmapModel)

    end

    private
    def authenticate
      redirect_to login_path(after: "/enroll") unless User.find_by(username: session[:username]).present?
    end
end
