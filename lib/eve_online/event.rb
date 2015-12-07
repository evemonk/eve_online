module EveOnline
  class Event
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def event_id
      @event_id ||= options.fetch('@eventID').to_i
    end

    def owner_id
      @owner_id ||= options.fetch('@ownerID').to_i
    end

    def owner_name
      @owner_name ||= options.fetch('@ownerName')
    end

    def event_date
      @event_date ||= begin
        ActiveSupport::TimeZone['UTC'].parse(options.fetch('@eventDate'))
      end
    end

    def event_title
      @event_title ||= options.fetch('@eventTitle')
    end

    def duration
      @duration ||= options.fetch('@duration').to_i
    end

    def importance
      # TODO: convert to boolean?
      # "@importance"=>"0",
      @importance ||= options.fetch('@importance')
    end

    def response
      @response ||= options.fetch('@response')
    end

    def event_text
      @event_text ||= options.fetch('@eventText')
    end

    def owner_type_id
      @owner_type_id ||= options.fetch('@ownerTypeID').to_i
    end
  end
end
