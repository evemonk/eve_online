module EveOnline
  module ESI
    class ServerStatus < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/status/?datasource=tranquility'.freeze

      def as_json
        {
          start_time: start_time,
          players: players,
          server_version: server_version,
          vip: vip
        }
      end

      def start_time
        start_time = response['start_time']

        parse_datetime_with_timezone(start_time) if start_time
      end

      def players
        response['players']
      end

      def server_version
        response['server_version']
      end

      def vip
        response['vip']
      end

      def scope; end

      def url
        API_ENDPOINT
      end
    end
  end
end
