module Elmas
  class BadRequestException < StandardError
    def initialize(response, parsed)
      @response = response
      @parsed = parsed
      super(message)
    end

    def message
      "code #{@response.status}: #{@parsed.error_message}"
    end
  end

  class UnauthorizedException < StandardError; end
end
