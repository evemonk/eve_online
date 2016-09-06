module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_assetlist.html
    class AssetList < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/AssetList.xml.aspx'.freeze

      ACCESS_MASK = 2

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
          [Item.new(row)]
        when Array
          output = []
          row.each do |item|
            output << Item.new(item)
          end
          output
        else
          raise ArgumentError
        end
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }"
      end
      memoize :url

      private

      def rowset
        result.fetch('rowset')
      end

      def row
        rowset.fetch('row')
      end
    end
  end
end
