# frozen_string_literal: true

module Elmas
  class PaymentCondition
    include Elmas::Resource

    def base_path
      "cashflow/PaymentConditions"
    end

    def mandatory_attributes
      %i[code]
    end

    # https//start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CashflowPaymentConditions
    def other_attributes
      %i[
        created description discount_payment_days
        discount_percentage payment_days payment_discount_type
        payment_end_of_months payment_method percentage
        VAT_calculation
      ]
    end
  end
end
