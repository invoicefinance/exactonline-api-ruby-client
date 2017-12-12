# frozen_string_literal: true

module Elmas
  class VatCode
    include Elmas::Resource

    def base_path
      "vat/VATCodes"
    end

    def other_attributes
      %i[account calculation_basis charged EU_sales_listing GL_discount_purchase GL_discount_sales GL_to_claim GL_to_pay intra_stat is_blocked
         legal_text tax_return_type type vat_doc_type vat_margin VAT_partial_ratio VAT_percentages VAT_transaction_type]
    end

    def mandatory_attributes
      %i[code description]
    end
  end
end
