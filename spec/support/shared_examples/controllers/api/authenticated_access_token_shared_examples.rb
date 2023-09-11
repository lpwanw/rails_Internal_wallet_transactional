# frozen_string_literal: true

RSpec.shared_examples "Api::AuthenticateAccessToken#authenticate_access_token!" do
  describe "#authenticate_access_token!" do
    context "when token not found" do
      let(:access_token) { "" }

      it_behaves_like "Api::RescueError#rescue_api_error!",
                      "unauthorized",
                      "unauthorized",
                      :unauthorized
    end

    context "when token expired" do
      before { token.update!(expires_at: 1.hour.ago) }

      it_behaves_like "Api::RescueError#rescue_api_error!",
                      "unauthorized",
                      "unauthorized",
                      :unauthorized
    end
  end
end
