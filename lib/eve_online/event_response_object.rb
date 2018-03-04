# frozen_string_literal: true

module EveOnline
  class EventResponseObject
    STATUSES = { 'Undecided' => :undecided, 'Accepted' => :accepted,
                 'Declined' => :declined, 'Tentative' => :tentative }.freeze

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
