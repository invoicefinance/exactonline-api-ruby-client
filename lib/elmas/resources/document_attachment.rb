# frozen_string_literal: true

module Elmas
  class DocumentAttachment
    include Elmas::Resource

    def base_path
      "documents/DocumentAttachments"
    end

    def mandatory_attributes
      %i[attachment document file_name]
    end

    def other_attributes
      []
    end
  end
end
