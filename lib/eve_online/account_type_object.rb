module EveOnline
  class AccountTypeObject
    STATUSES = { 'Character' => :character, 'Account' => :account }.freeze

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
