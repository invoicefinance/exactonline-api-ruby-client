# frozen_string_literal: true

module Elmas
  class Costunit
    include Elmas::Resource

    def base_path
      "hrm/Costunits"
    end

    def mandatory_attributes
      %i[code description]
    end

    def other_attributes
      %i[account]
    end
  end
end
