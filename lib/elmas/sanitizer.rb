require "active_support"
require "active_support/time"
require "active_support/core_ext/time/zones"
module Elmas
  module Resource
    module Sanitizer
      # Parse the attributes for to post to the API
      def sanitize
        to_submit = {}
        @attributes.each do |key, value|
          next if key == :id || !valid_attribute?(key)
          key = Utils.camelize(key)
          submit_value = sanitize_relationship(value)
          to_submit[key] = submit_value
        end
        to_submit
      end

      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/PerceivedComplexity
      def sanitize_relationship(value)
        if value.is_a?(Elmas::Resource)
          return value.id # Turn relation into ID
        elsif value.is_a?(Array)
          return sanitize_has_many(value)
        elsif value.is_a?(Time) || value.is_a?(Date) || value.is_a?(DateTime)
          return sanitize_date_time(value)
        elsif value.is_a?(String) && value.match(/(Date\()/)
          number = value.scan(/\d+/).first.to_i / 1000.0
          Time.zone = ActiveSupport::TimeZone.new("Europe/Amsterdam")
          return sanitize_date_time(Time.zone.at(number))
        else
          return value
        end
      end
      # rubocop:enable Metrics/CyclomaticComplexity
      # rubocop:enable Metrics/PerceivedComplexity

      def sanitize_date_time(value)
        value.strftime("%Y-%m-%d")
      end

      def sanitize_has_many(value)
        submit_value = []
        value.each do |e|
          submit_value << e.sanitize
        end
        submit_value
      end
    end
  end
end
