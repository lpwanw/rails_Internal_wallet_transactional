# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UserController do
  describe "POST api/v1/user/sign_in" do
    subject { post url, params:, as: :json }

    let(:url) { "/api/v1/user/sign_in" }
    let(:params) do
      {
        email:,
        password:
      }
    end
    let!(:user) { create :user, password: "Aa@123456" }
    let(:password) { "Aa@123456" }
    let(:email) { user.email }

    context "when sign_in success" do
      context "when create new token" do
        it { expect { subject }.to change(Token, :count).by(1) }

        context "when assign token attributes" do
          let(:token) { Token.last }

          before { subject }

          it { expect(token.user).to eq user }
        end
      end

      context "when response success" do
        let(:token) { Token.last }

        before { subject }

        it { expect(response_body[:id]).to eq token.id }
        it { expect(response_body[:user_id]).to eq token.user_id }
        it { expect(response_body[:access_token]).to eq token.access_token }
        it { expect(response_body[:refresh_token]).to eq token.refresh_token }
        it { expect(response_body[:expires_at]).to eq token.expires_at.as_json }

        it { expect(response).to have_http_status(:created) }
      end
    end

    context "when sign_in failed" do
      before { subject }

      context "when email not found" do
        let(:email) { "invalid_email" }

        it { expect(response_body).to be_blank }
        it { expect(response).to have_http_status(:unauthorized) }
      end

      context "when wrong password" do
        let(:password) { "invalid_password" }

        it { expect(response_body).to be_blank }
        it { expect(response).to have_http_status(:unauthorized) }
      end
    end
  end
end
