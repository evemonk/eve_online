module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_assetlist.html
    class AssetList < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/AssetList.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id, :flat

      def initialize(key_id, v_code, character_id, flat = 1)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @flat = flat
      end

      def assets
        case row
        when Hash
          [EveOnline::Item.new(row)]
        when Array
          output = []
          row.each do |item|
            output << EveOnline::Item.new(item)
          end
          output
        else
          raise ArgumentError
        end
      end

      def row
        @row ||= rowset.fetch('row')
      end

      def rowset
        @rowset ||= result.fetch('rowset')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }"
      end
    end
  end
end
