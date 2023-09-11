# frozen_string_literal: true

module Api::RescueError
  extend ActiveSupport::Concern

  included do
    rescue_from Api::Error::UnauthorizedError, with: :rescue_api_error
  end

  private

  def rescue_api_error(error)
    render json: Api::ErrorSerializer.new(error).as_json, status: error.status
  end
end
