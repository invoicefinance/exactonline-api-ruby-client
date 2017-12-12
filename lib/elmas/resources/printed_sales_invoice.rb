# frozen_string_literal: true

module Elmas
  # We can use the PrintedSalesInvoice to change the status of SalesInvoices from
  # Open to 'Verwerkt' while at the same time sending a PDF of the invoice to the
  # end user by e-mail.
  #
  # This endpoint only supports the POST method.
  #
  class PrintedSalesInvoice
    include Elmas::Resource

    def valid_actions
      %i[post]
    end

    def base_path
      "salesinvoice/PrintedSalesInvoices"
    end

    def mandatory_attributes
      %i[invoice_ID]
    end

    # https//start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoicePrintedSalesInvoices
    def other_attributes
      %i[
        division document document_creation_error document_creation_success
        document_layout email_creation_error email_creation_success email_layout
        extra_text invoice_date postbox_message_creation_error
        postbox_message_creation_success postbox_sender reporting_period
        reporting_year send_email_to_customer send_invoice_to_customer_postbox
        send_output_based_on_account
      ]
    end
  end
end
