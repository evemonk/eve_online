module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_blueprints.html
    class Blueprints < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/Blueprints.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
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

      def row
        @row ||= rowset.fetch('row')
      end

      def rowset
        @rowset ||= result.fetch('rowset')
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end
