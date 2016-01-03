module EveOnline
  class EventResponseObject
    attr_reader :input
    
    def initialize(input)
      @input = input
    end
    
    def value
      @value ||= case input
        when 'Undecided'
          :undecided
        when 'Accepted'
          :accepted
        when 'Declined'
          :declined
        when 'Tentative'
          :tentative
        else
          raise ArgumentError
        end
    end  
  end
end
