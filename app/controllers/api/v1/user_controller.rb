# frozen_string_literal: true

class Api::V1::UserController < Api::BaseController
  before_action :authenticate_sign_in_user, only: [:sign_in]

  def sign_in
    token = @user.tokens.create

    render json: token, status: :created
  end

  private

  def authenticate_sign_in_user
    @user = User.find_by(email: params[:email])
    return if @user&.authenticate(params[:password])

    raise Api::Error::UnauthorizedError, I18n.t("api.v1.user.sign_in.error.unauthorized")
  end
end
