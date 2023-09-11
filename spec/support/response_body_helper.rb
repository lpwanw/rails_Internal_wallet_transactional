# frozen_string_literal: true

module ResponseBodyHelper
  def response_body
    JSON.parse(response.body).with_indifferent_access
  end
end
