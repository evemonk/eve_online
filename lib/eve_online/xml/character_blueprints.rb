module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_blueprints.html
    class CharacterBlueprints < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/Blueprints.xml.aspx'.freeze

      ACCESS_MASK = 2

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
      end

      def blueprints
        case row
        when Hash
          [Blueprint.new(row)]
        when Array
          output = []
          row.each do |blueprint|
            output << Blueprint.new(blueprint)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :blueprints

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end

      private

      def rowset
        result.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end
