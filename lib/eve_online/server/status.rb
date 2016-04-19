module EveOnline
  module Server
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/server/serv_serverstatus.html
    class Status < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/Server/ServerStatus.xml.aspx'.freeze

      def as_json(*args)
        {
          current_time: current_time,
          cached_until: cached_until,
          server_open: server_open,
          online_players: online_players
        }
      end

      def server_open
        @server_open ||= result.fetch('serverOpen') == 'True'
      end

      alias server_open? server_open

      def online_players
        @online_players ||= result.fetch('onlinePlayers').to_i
      end

      def url
        API_ENDPOINT
      end
    end
  end
end
