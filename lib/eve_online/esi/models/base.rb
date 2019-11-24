# frozen_string_literal: true

require "active_support/time"

module EveOnline
  module ESI
    module Models
      class Base
        attr_reader :options

        def initialize(options)
          @options = options
        end

        private

        def parse_datetime_with_timezone(value)
          ActiveSupport::TimeZone["UTC"].parse(value)
        end
      end
    end
  end
end
