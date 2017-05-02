module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html
    class CharacterSkillQueue < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/SkillQueue.xml.aspx'.freeze

      ACCESS_MASK = 262_144

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def skills
        case row
        when Hash
          [EveOnline::XML::Models::SkillQueueEntry.new(row)]
        when Array
          output = []
          row.each do |skill|
            output << EveOnline::XML::Models::SkillQueueEntry.new(skill)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :skills

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
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
