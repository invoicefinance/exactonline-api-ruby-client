# frozen_string_literal: true

module Elmas
  class SalesInvoiceLine
    # An sales_invoice_line should always have a reference to an item and to an sales_invoice.
    include Elmas::Resource
    include Elmas::SharedSalesAttributes

    def base_path
      "salesinvoice/SalesInvoiceLines"
    end

    def mandatory_attributes
      %i[item invoice_ID]
    end

    def other_attributes
      SHARED_LINE_ATTRIBUTES.inject(
        %i[employee end_time line_number start_time subscription VAT_amount_DC VAT_amount_FC GL_account discount unit_price],
        :<<
      )
    end
  end
end
