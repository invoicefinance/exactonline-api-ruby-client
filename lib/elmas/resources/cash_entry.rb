# frozen_string_literal: true

module Elmas
  class CashEntry
    include Elmas::Resource

    def base_path
      "financialtransaction/CashEntries"
    end

    def mandatory_attributes
      %i[journal_code cash_entry_lines]
    end

    def other_attributes
      %i[
        currency closing_balance_FC entry_number
        financial_period financial_year openening_balance_FC
      ]
    end
  end
end
