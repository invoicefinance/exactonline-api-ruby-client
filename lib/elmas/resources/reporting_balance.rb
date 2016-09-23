module Elmas
  class ReportingBalance
    # A cash entry line belongs to a cash entry
    include Elmas::Resource

    def base_path
      "financial/ReportingBalance"
    end
  end
end
