class GptController < ActionController::Base
require "openai"
require 'dotenv'
Dotenv.load

  before_action :set_common_variable

  private
  HACKU_API_KEY = ENV["API_KEY"]

  # APIキーの設定
  def set_common_variable
    @client = OpenAI::Client.new(access_token: HACKU_API_KEY)
  end
end

