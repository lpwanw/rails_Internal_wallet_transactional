# frozen_string_literal: true

module Api::JsonResponse
  extend ActiveSupport::Concern

  private

  def json_response(data, status: :ok)
    json = { data:, success: true }

    render json:, status:
  end
end
