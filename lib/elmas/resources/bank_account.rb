# frozen_string_literal: true

module Elmas
  class BankAccount
    # An account needs a name
    include Elmas::Resource

    def valid_actions
      %i[get]
    end

    def base_path
      "crm/BankAccounts"
    end

    def mandatory_attributes
      %i[account]
    end

    # https//start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=CRMAccounts
    # rubocopdisable Metrics/MethodLength
    def other_attributes
      %i[
        id account account_name bank
        bank_account bank_description
        bank_name BIC_code description
        division format IBAN type
        type_description
      ]
    end
  end
end
