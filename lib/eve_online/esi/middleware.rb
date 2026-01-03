# frozen_string_literal: true

require "active_support/time"

module EveOnline
  module ESI
    class Middleware < Faraday::Middleware
      # From vultr gem. Thanks, Chris Oliver!
      ISO_DATE_FORMAT = /\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|((\+|-)\d{2}:?\d{2}))\Z/xm

      def on_complete(env)
        parse_dates! env[:body]
      end

      private

      def parse_dates!(value)
        case value
        when Hash
          value.each { |key, element| value[key] = parse_dates!(element) }
        when Array
          value.each_with_index { |element, index| value[index] = parse_dates!(element) }
        when ISO_DATE_FORMAT
          ActiveSupport::TimeZone["UTC"].parse(value)
        else
          value
        end
      end
    end
  end
end
