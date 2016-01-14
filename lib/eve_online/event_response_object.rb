module EveOnline
  class EventResponseObject
    STATUSES = { 'Undecided' => :undecided, 'Accepted' => :accepted,
                 'Declined' => :declined, 'Tentative' => :tentative }

    attr_reader :input
    
    def initialize(input)
      @input = input
    end
    
    def value
      raise ArgumentError unless STATUSES.has_key?(input)

      @value ||= STATUSES.fetch(input)
    end
  end
end
