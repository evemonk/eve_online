module EveOnline
  module ESI
    module Models
      class Character < Base
        def as_json
          {
            corporation_id: corporation_id,
            birthday: birthday,
            name: name,
            gender: gender,
            race_id: race_id,
            bloodline_id: bloodline_id,
            description: description,
            alliance_id: alliance_id,
            ancestry_id: ancestry_id,
            security_status: security_status,
            faction_id: faction_id
          }
        end

        def corporation_id
          options['corporation_id']
        end

        def birthday
          birthday = options['birthday']

          parse_datetime_with_timezone(birthday) if birthday
        end

        def name
          options['name']
        end

        def gender
          options['gender']
        end

        def race_id
          options['race_id']
        end

        def bloodline_id
          options['bloodline_id']
        end

        def description
          options['description']
        end

        def alliance_id
          options['alliance_id']
        end

        def ancestry_id
          options['ancestry_id']
        end

        def security_status
          options['security_status']
        end

        def faction_id
          options['faction_id']
        end
      end
    end
  end
end
