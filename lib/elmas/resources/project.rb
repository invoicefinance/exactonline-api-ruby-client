# frozen_string_literal: true

module Elmas
  class Project
    include Elmas::Resource

    def base_path
      "project/Projects"
    end

    def mandatory_attributes
      %i[account description code type]
    end

    # https://start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=ProjectProjects
    def other_attributes
      %i[account account_code AccountContact account_name allow_additional_invoicing block_entry block_rebilling budgeted_amount budgeted_costs
         budgeted_hours_per_hour_type BudgetedRevenue BudgetType BudgetTypeDescription clasification classification_description code costs_amount_fc
         created creator creator_full_name customer_p_onumber description division division_name end_date fixed_price_item
         fixed_price_item_description invoice_as_quoted invoice_terms manager manager_fullname markup_percentage modified modifier modifier_full_name
         notes prepaid_item prepaid_item_description prepaid_type prepaid_type_description project_restriction_employees project_restriction_items
         project_restriction_rebillings sales_time_quantity source_quotation start_date time_quantity_to_alert type type_description
         use_billing_milestones]
    end
  end
end
