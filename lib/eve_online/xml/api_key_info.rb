module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account/account_apikeyinfo.html
    class ApiKeyInfo < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/account/APIKeyInfo.xml.aspx'.freeze

      attr_reader :key_id, :v_code

      def initialize(key_id, v_code)
        super()
        @key_id = key_id
        @v_code = v_code
      end

      def as_json
        {
          expires: expires,
          api_key_type: api_key_type,
          access_mask: access_mask,
          current_time: current_time,
          cached_until: cached_until
        }
      end

      def characters
        case row
        when Hash
          [Character.new(row)]
        when Array
          output = []
          row.each do |character|
            output << Character.new(character)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :characters

      def expires
        parse_datetime_with_timezone(key.fetch('@expires'))
      end

      def api_key_type
        AccountTypeObject.new(key.fetch('@type')).value
      end

      def access_mask
        key.fetch('@accessMask').to_i
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
      end

      private

      def key
        result.fetch('key')
      end

      def rowset
        key.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end
