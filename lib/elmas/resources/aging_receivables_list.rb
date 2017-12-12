# frozen_string_literal: true

module Elmas
  # We can use the AgingReceivablesList to change the status of SalesInvoices from
  # Open to 'Verwerkt' while at the same time sending a PDF of the invoice to the
  # end user by e-mail.
  #
  # This endpoint only supports the POST method.
  #
  class AgingReceivablesList
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "read/financial/AgingReceivablesList"
    end

    def mandatory_attributes
      []
    end

    # https//start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SalesInvoiceAgingReceivablesLists
    def other_attributes
      %i[
        account_id account_code account_name age_group1 age_group1_amount age_group1_description
        age_group2 age_group2_amount age_group2_description age_group3 age_group3_amount age_group3_description
        age_group4 age_group4_amount age_group4_description currency_code total_amount
      ]
    end
  end
end
