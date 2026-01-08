require "ruby_llm"

# config/initializers/ruby_llm.rb
RubyLLM.configure do |config|
  config.gemini_api_key    = Rails.application.credentials.gemini&.api_key    # Get from Google AI Studio
  config.openai_api_key    = Rails.application.credentials.openai&.api_key   # Get from OpenAI Dashboard
  config.anthropic_api_key = ENV['ANTHROPIC_API_KEY'] # Get from Anthropic Console
end