# frozen_string_literal: true

require "swagger_helper"

RSpec.describe Api::V1::UserController do
  path "/api/v1/user/sign_in" do
    post "User Sign In" do
      tags "User"

      consumes "application/json"
      produces "application/json"

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: "user_name@example.com" },
          password: { type: :string, example: "password" }
        }, required: %w[email password]
      }

      response "201", "Sign In Success" do
        schema "$ref" => "#/components/schemas/token"
        xit
      end

      response "401", "Unauthorized" do
        schema "$ref" => "#/components/schemas/unauthorized_error"
        xit
      end
    end
  end
end
