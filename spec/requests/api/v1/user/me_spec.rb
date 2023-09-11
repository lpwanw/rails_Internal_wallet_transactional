# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UserController do
  describe "GET api/v1/user/me" do
    subject { get url, headers:, as: :json }

    let(:url) { "/api/v1/user/me" }
    let(:headers) do
      {
        "X-ACCESS-TOKEN" => access_token
      }
    end
    let(:user) { create :user, password: "Aa@123456" }
    let!(:token) { create :token, user: }
    let(:access_token) { token.access_token }

    it_behaves_like "Api::AuthenticateAccessToken#authenticate_access_token!"

    context "when response success" do
      before { subject }

      it { expect(response_body[:success]).to be true }

      it { expect(response_body[:data][:id]).to eq user.id }
      it { expect(response_body[:data][:email]).to eq user.email }
      it { expect(response_body[:data][:created_at]).to eq user.created_at.as_json }
      it { expect(response_body[:data][:updated_at]).to eq user.updated_at.as_json }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
