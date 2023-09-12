# frozen_string_literal: true

class LatestStockPrice::Model::Stock
  ATTR_ACCESSORS = %i[symbol identifier open day_high day_low last_price previous_close change p_change
                      total_traded_volume total_traded_value last_update_time year_high year_low per_change_365d
                      per_change_30d].freeze

  attr_accessor(*ATTR_ACCESSORS)

  def initialize(args = {})
    ATTR_ACCESSORS.each do |attribute_name|
      instance_variable_set("@#{attribute_name}", args[attribute_name])
    end
  end
end
