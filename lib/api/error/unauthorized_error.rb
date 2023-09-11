# frozen_string_literal: true

class Api::Error::UnauthorizedError < Api::Error::BaseError
  def status
    :unauthorized
  end
end
