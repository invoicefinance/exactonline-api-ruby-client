# frozen_string_literal: true

module Elmas
  class TimeTransaction
    include Elmas::Resource

    def base_path
      "project/TimeTransactions"
    end

    def mandatory_attributes
      %i[account item quantity]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectTimeTransactions
    def other_attributes
      %i[account account_name activity activity_description amount amount_fc attachment created creator creator_full_name currency date division
         division_description employee end_time entry_number error_text hour_status item item_description item_divisable modified modifier
         modifier_full_name notes price price_fc project project_account project_account_code project_account_name project_description quantity
         start_time subscription subscription_account subscription_account_code subscription_account_name subscription_description
         subscription_number type]
    end
  end
end
