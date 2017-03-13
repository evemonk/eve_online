require 'active_support/time'

module EveOnline
  module XML
    module Models
      class ApiKeyInfo
        attr_reader :options

        def initialize(options)
          @options = options
        end

        def as_json
          {
            access_mask: access_mask,
            api_key_type: api_key_type,
            expires: expires
          }
        end

        def access_mask
          options.fetch('@accessMask').to_i
        end

        def api_key_type
          AccountTypeObject.new(options.fetch('@type')).value
        end

        def expires
          ActiveSupport::TimeZone['UTC'].parse(options.fetch('@expires'))
        end
      end
    end
  end
end
