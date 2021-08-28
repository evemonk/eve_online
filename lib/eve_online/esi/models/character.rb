# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Character < Base
        def as_json
          {
            alliance_id: alliance_id,
            birthday: birthday,
            bloodline_id: bloodline_id,
            corporation_id: corporation_id,
            description: description,
            faction_id: faction_id,
            gender: gender,
            name: name,
            race_id: race_id,
            security_status: security_status,
            title: title
          }
        end

        def alliance_id
          options["alliance_id"]
        end

        def birthday
          birthday = options["birthday"]

          parse_datetime_with_timezone(birthday) if birthday
        end

        def bloodline_id
          options["bloodline_id"]
        end

        def corporation_id
          options["corporation_id"]
        end

        def description
          options["description"]
        end

        def faction_id
          options["faction_id"]
        end

        def gender
          options["gender"]
        end

        def name
          options["name"]
        end

        def race_id
          options["race_id"]
        end

        def security_status
          options["security_status"]
        end

        def title
          options["title"]
        end
      end
    end
  end
end
