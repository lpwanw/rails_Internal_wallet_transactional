# frozen_string_literal: true

class Api::V1::UserController < Api::BaseController
  before_action :authenticate_sign_in_user, only: [:sign_in]
  skip_before_action :authenticate_access_token!, only: [:sign_in]

  def me
    json_response UserSerializer.new(@current_user)
  end

  def sign_in
    token = @user.tokens.create

    json_response TokenSerializer.new(token), status: :created
  end

  private

  def authenticate_sign_in_user
    @user = User.find_by(email: params[:email])
    return if @user&.authenticate(params[:password])

    raise Api::Error::UnauthorizedError, I18n.t("api.v1.user.sign_in.error.unauthorized")
  end
end
