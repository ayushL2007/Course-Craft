class PathController < ApplicationController
    def index
      if is_authenticated
        @user = User.find_by(username: session[:username])
        @path = @user.paths
        if @path.length==0
          @error = "Enroll in course first"
        end
      else
        @error = "Login to access course" unless @user.present?
      end
    end

    def show
      redirect_to login_path unless is_authenticated
      @path = Path.find(params[:id])

      unless @path.user == User.find_by(username: session[:username])
        flash[:error] = "Content Not found"
        @path=nil

      else
        @path_info = @path.path_info

        @roadmap = @path.roadmaps.first
        @courses = @roadmap.attributes.select { |k,v| k.include?("course") && !v.nil?}
        # @roadmap = to_hash(@roadmap.to_s)
        @courses = to_hash(@courses.to_s)
      end
    end

    def update_progress
      names = params[:name]
      p names
      @roadmap = Roadmap.find params[:id]
    end

    private
    def is_authenticated
      User.find_by(username: session[:username]).present?
    end

    private
    def to_hash(content)
      clean_string = content.gsub("=>", ':').gsub('\n', "")
      outer_hash = JSON.parse(clean_string)
      final_hash = outer_hash.transform_values do |inner_string|
        JSON.parse(inner_string.gsub("=>", ":").gsub('\n', ""))
      end
      final_hash
    end
end
