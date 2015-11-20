module EveOnline
  # http://wiki.eve-id.net/APIv2_Account_AccountStatus_XML
  class AccountStatus < Base
    API_ENDPOINT = 'https://api.eveonline.com/account/AccountStatus.xml.aspx'

    def current_time
      eveapi.fetch('currentTime')
    end

    def paid_until
      result.fetch('paidUntil')
    end

    def create_date
      result.fetch('createDate')
    end

    def logon_count
      result.fetch('logonCount').to_i
    end

    def logon_minutes
      result.fetch('logonMinutes').to_i
    end

    def cached_until
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
      "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
    end
  end
end
