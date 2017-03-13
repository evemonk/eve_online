module EveOnline
  module XML
    module Models
      class AccountTypeObject
        STATUSES = { 'Character' => :character, 'Account' => :account,
                     'Corporation' => :corporation }.freeze

        attr_reader :input

        def initialize(input)
          @input = input
        end

        def value
          raise ArgumentError unless STATUSES.key?(input)

          @value ||= STATUSES.fetch(input)
        end
      end
    end
  end
end
