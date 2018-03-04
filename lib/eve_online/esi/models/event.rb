# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Event < Base
        def as_json
          {
            event_id: event_id,
            event_date: event_date,
            title: title,
            importance: importance,
            event_response: event_response
          }
        end

        def event_id
          options['event_id']
        end

        def event_date
          event_date = options['event_date']

          parse_datetime_with_timezone(event_date) if event_date
        end

        def title
          options['title']
        end

        def importance
          options['importance']
        end

        def event_response
          options['event_response']
        end
      end
    end
  end
end
