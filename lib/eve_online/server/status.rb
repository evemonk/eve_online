module EveOnline
  module Server
    # http://wiki.eve-id.net/APIv2_Server_ServerStatus_XML
    class Status < Base
      API_ENDPOINT = 'https://api.eveonline.com/Server/ServerStatus.xml.aspx'

      def as_json
        {
          current_time: current_time,
          cached_until: cached_until,
          server_open: server_open,
          online_players: online_players
        }
      end

      def server_open
        result.fetch('serverOpen') == 'True'
      end

      alias server_open? server_open

      def online_players
        result.fetch('onlinePlayers').to_i
      end

      def version
        eveapi.fetch('@version').to_i
      end

      def url
        API_ENDPOINT
      end
    end
  end
end
