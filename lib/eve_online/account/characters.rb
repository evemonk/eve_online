module EveOnline
  module Account
    # http://wiki.eve-id.net/APIv2_Account_Characters_XML
    class Characters < Base
      API_ENDPOINT = 'https://api.eveonline.com/account/Characters.xml.aspx'

      def version
        eveapi.fetch('@version').to_i
      end

      def characters
        case row
        when Hash
          [EveOnline::Character.new(row)]
        when Array
          output = []
          row.each do |character|
            output << EveOnline::Character.new(character)
          end
          output
        else
          raise ArgumentError
        end
      end

      def row
        rowset.fetch('row')
      end

      def rowset
        result.fetch('rowset')
      end

      def url
        "#{ API_ENDPOINT}?keyID=#{ key_id }&vCode=#{ v_code }"
      end
    end
  end
end
