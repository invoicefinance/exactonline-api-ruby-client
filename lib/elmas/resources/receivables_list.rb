# frozen_string_literal: true

module Elmas
  # We can use the AgingReceivablesList to change the status of SalesInvoices from
  # Open to 'Verwerkt' while at the same time sending a PDF of the invoice to the
  # end user by e-mail.
  #
  # This endpoint only supports the POST method.
  #
  class ReceivablesList
    include Elmas::Resource

    def valid_actions
      [:get]
    end

    def base_path
      "read/financial/ReceivablesList"
    end

    def mandatory_attributes
      []
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ReadFinancialReceivablesList
    def other_attributes
      %i[description hid account_code account_id account_name amount amount_in_transit currency_code description due_date entry_number id
         invoice_date invoice_number journal_code journal_description your_ref]
    end
  end
end
