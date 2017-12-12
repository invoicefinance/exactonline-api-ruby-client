# frozen_string_literal: true

require File.expand_path("../request", __FILE__)
require File.expand_path("../config", __FILE__)
require File.expand_path("../oauth", __FILE__)

module Elmas
  # @private
  class API
    # @private
    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options = {})
      options = Elmas.options.merge(options)
      Config::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def config
      conf = {}
      Config::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end

    include Request
    include OAuth
  end
end
