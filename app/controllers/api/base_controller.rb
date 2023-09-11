# frozen_string_literal: true

class Api::BaseController < ActionController::API
  include Api::JsonResponse
  include Api::RescueError

  include Api::AuthenticateAccessToken
end
