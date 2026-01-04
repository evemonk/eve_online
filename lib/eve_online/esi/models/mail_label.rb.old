# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MailLabel < Base
        def as_json
          {
            color: color,
            label_id: label_id,
            name: name,
            unread_count: unread_count
          }
        end

        def color
          options["color"]
        end

        def label_id
          options["label_id"]
        end

        def name
          options["name"]
        end

        def unread_count
          options["unread_count"]
        end
      end
    end
  end
end
