module EveOnline
  module ESI
    module Characters
      class Character < Base
        API_ENDPOINT = 'https://esi.tech.ccp.is/latest/characters/%s/?datasource=tranquility'.freeze

        attr_reader :character_id

        def initialize(character_id)
          super()
          @character_id = character_id
        end

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
            security_status: security_status
          }
        end

        def corporation_id
          response.fetch('corporation_id')
        end

        def birthday
          parse_datetime_with_timezone(response.fetch('birthday'))
        end

        def name
          response.fetch('name')
        end

        def gender
          response.fetch('gender')
        end

        def race_id
          response.fetch('race_id')
        end

        def bloodline_id
          response.fetch('bloodline_id')
        end

        def description
          response.fetch('description')
        end

        def alliance_id
          response.fetch('alliance_id')
        end

        def ancestry_id
          response.fetch('ancestry_id')
        end

        def security_status
          response.fetch('security_status')
        end

        def url
          API_ENDPOINT % character_id
        end
      end
    end
  end
end
