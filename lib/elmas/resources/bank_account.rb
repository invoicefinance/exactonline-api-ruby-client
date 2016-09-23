module Elmas
  class BankAccount
    include Elmas::Resource

    def base_path
      "crm/BankAccounts"
    end

    # No clue if this is correct
    def mandatory_attributes
      [:account, :bank_account]
    end

    def other_attributes
      [
        :bank_account_holder_name, :bic_code, :description, :main
      ]
    end
  end
end
