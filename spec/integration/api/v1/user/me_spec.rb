# frozen_string_literal: true

require "swagger_helper"

RSpec.describe Api::V1::UserController do
  path "/api/v1/user/me" do
    get "Get user info" do
      tags "User"

      security [{ access_token: [] }]

      produces "application/json"

      response "200", "Sign In Success" do
        schema "$ref" => "#/components/schemas/user"
        xit
      end

      response "401", "Unauthorized" do
        schema "$ref" => "#/components/schemas/unauthorized_error"
        xit
      end
    end
  end
end
