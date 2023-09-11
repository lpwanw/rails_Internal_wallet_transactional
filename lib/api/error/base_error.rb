# frozen_string_literal: true

class Api::Error::BaseError < StandardError
  def initialize(message = nil)
    @message = message
    super(message)
  end

  def success
    false
  end

  def status
    raise NotImplementedError
  end

  def error_message
    @message || default_message
  end

  def errors
    [
      {
        full_message: default_message
      }
    ]
  end

  private

  def default_message
    i18n_path = self.class.name.underscore.tr("/", ".")

    I18n.t i18n_path, default: I18n.t("api.error.base_error")
  end
end
