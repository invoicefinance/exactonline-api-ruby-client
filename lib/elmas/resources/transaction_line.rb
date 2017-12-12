# frozen_string_literal: true

module Elmas
  class TransactionLine
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "financialtransaction/TransactionLines"
    end

    def mandatory_attributes
      []
    end

    def other_attributes
      %i[asset_code]
    end
  end
end
