# frozen_string_literal: true

module Elmas
  class Document
    include Elmas::Resource

    def base_path
      "documents/Documents"
    end

    def mandatory_attributes
      %i[subject type]
    end

    def other_attributes
      %i[
        account amount_FC body category category_description creator_full_name
        currency document_date document_folder financial_transaction_entry_ID
        HID language opportunity sales_invoice_number shop_order_number
      ]
    end
  end
end
