class GptController < ActionController::Base
    require "openai"
require 'dotenv'
Dotenv.load

  before_action :set_common_variable

  private

  # APIキーを設定
  def set_common_variable
    @client = OpenAI::Client.new(access_token: "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")
  end
end

