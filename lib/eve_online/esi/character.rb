module EveOnline
  module ESI
    class Character < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v4/characters/%s/?datasource=tranquility'.freeze

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
        response['corporation_id']
      end

      def birthday
        birthday = response['birthday']

        parse_datetime_with_timezone(birthday) if birthday
      end

      def name
        response['name']
      end

      def gender
        response['gender']
      end

      def race_id
        response['race_id']
      end

      def bloodline_id
        response['bloodline_id']
      end

      def description
        response['description']
      end

      def alliance_id
        response['alliance_id']
      end

      def ancestry_id
        response['ancestry_id']
      end

      def security_status
        response['security_status']
      end

      def scope; end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end
