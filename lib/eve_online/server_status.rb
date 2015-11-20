module EveOnline
  # http://wiki.eve-id.net/APIv2_Server_ServerStatus_XML
  class ServerStatus < Base
    API_ENDPOINT = 'https://api.eveonline.com/Server/ServerStatus.xml.aspx'

    def as_json
      {
        current_time: current_time,
        cached_until: cached_until,
        server_open: server_open?,
        online_players: online_players
      }
    end

    def current_time
      # TODO: time in "(GMT) Monrovia, Reykjavik".
      eveapi.fetch('currentTime')
    end

    def server_open?
      result.fetch('serverOpen') == 'True'
    end

    def online_players
      result.fetch('onlinePlayers').to_i
    end

    def cached_until
      # TODO: time in "(GMT) Monrovia, Reykjavik".
      eveapi.fetch('cachedUntil')
    end

    def version
      eveapi.fetch('@version').to_i
    end

    def result
      eveapi.fetch('result')
    end

    def eveapi
      response.fetch('eveapi')
    end

    def url
      API_ENDPOINT
    end
  end
end
