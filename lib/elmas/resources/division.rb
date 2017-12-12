# frozen_string_literal: true

module Elmas
  class Division
    include Elmas::Resource

    def base_path
      "system/Divisions"
    end

    def mandatory_attributes
      []
    end

    # https//start.exactonline.nl/docs/HlpRestAPIResourcesDetails.aspx?name=SystemSystemDivisions
    def other_attributes
      %i[
        code address_line1 address_line2 address_line3
        chamber_of_commerce_number city country created currency
        current customer customer_code customer_name description
        email hid is_main_division modified phone postcode state
        status VAT_number
      ]
    end
  end
end
