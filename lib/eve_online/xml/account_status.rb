require 'forwardable'

module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account/account_accountstatus.html
    class AccountStatus < BaseXML
      extend Forwardable

      API_ENDPOINT = 'https://api.eveonline.com/account/AccountStatus.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :model

      def_delegators :model, :as_json, :paid_until, :create_date, :logon_count, :logon_minutes

      def initialize(key_id, v_code)
        super()
        @key_id = key_id
        @v_code = v_code
      end

      def model
        Models::AccountStatus.new(result)
      end
      memoize :model

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end
