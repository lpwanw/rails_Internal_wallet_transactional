# frozen_string_literal: true

module Api::AuthenticateAccessToken
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_access_token!
  end

  private

  def authenticate_access_token!
    @token = Token.not_expired.find_by(access_token: request.headers["HTTP_X_ACCESS_TOKEN"])

    return @current_user = @token.user if @token

    raise Api::Error::UnauthorizedError, I18n.t("api.error.unauthorized_error")
  end
end
