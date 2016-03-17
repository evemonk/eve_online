module EveOnline
  class Event
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def as_json(*args)
      {
        event_id: event_id,
        owner_id: owner_id,
        owner_name: owner_name,
        event_date: event_date,
        event_title: event_title,
        duration: duration,
        importance: importance,
        response: response,
        event_text: event_text,
        owner_type_id: owner_type_id
      }
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
      @event_date ||= ActiveSupport::TimeZone['UTC'].parse(options.fetch('@eventDate'))
    end

    def event_title
      @event_title ||= options.fetch('@eventTitle')
    end

    def duration
      @duration ||= options.fetch('@duration').to_i
    end

    def importance
      @importance ||= options.fetch('@importance').eql?('1')
    end

    def response
      @response ||= EveOnline::EventResponseObject.new(options.fetch('@response')).value
    end

    def event_text
      @event_text ||= options.fetch('@eventText')
    end

    def owner_type_id
      @owner_type_id ||= options.fetch('@ownerTypeID').to_i
    end
  end
end
