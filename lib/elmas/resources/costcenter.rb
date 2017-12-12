# frozen_string_literal: true

module Elmas
  class Costcenter
    include Elmas::Resource

    def base_path
      "hrm/Costcenters"
    end

    def mandatory_attributes
      %i[code description]
    end

    def other_attributes
      %i[active]
    end
  end
end
