# frozen_string_literal: true

module Elmas
  class PurchaseEntryLine < Elmas::BaseEntryLine
    include Elmas::Resource

    def base_path
      "purchaseentry/PurchaseEntryLines"
    end
  end
end
