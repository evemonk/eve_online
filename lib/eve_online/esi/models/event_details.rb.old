# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class EventDetails < Base
        def as_json
          {
            date: date,
            duration: duration,
            event_id: event_id,
            importance: importance,
            owner_id: owner_id,
            owner_name: owner_name,
            owner_type: owner_type,
            event_response: event_response,
            text: text,
            title: title
          }
        end

        def date
          date = options["date"]

          parse_datetime_with_timezone(date) if date
        end

        def duration
          options["duration"]
        end

        def event_id
          options["event_id"]
        end

        def importance
          options["importance"]
        end

        def owner_id
          options["owner_id"]
        end

        def owner_name
          options["owner_name"]
        end

        def owner_type
          options["owner_type"]
        end

        def event_response
          options["response"]
        end

        def text
          options["text"]
        end

        def title
          options["title"]
        end
      end
    end
  end
end
