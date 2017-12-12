# frozen_string_literal: true

module Elmas
  class Mailbox
    include Elmas::Resource

    def base_path
      "mailbox/Mailboxes"
    end

    def other_attributes
      %i[
        account description for_division publish
        type valid_from valid_to
      ]
    end

    def mandatory_attributes
      %i[mailbox]
    end
  end
end
