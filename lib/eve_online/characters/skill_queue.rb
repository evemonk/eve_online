module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html
    class SkillQueue < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/SkillQueue.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      # def skills
      #   case row
      #   when Hash
      #     [SkillQueueEntry.new(row)]
      #   when Array
      #     output = []
      #     row.each do |blueprint|
      #       output << SkillQueueEntry.new(blueprint)
      #     end
      #     output
      #   else
      #     raise ArgumentError
      #   end
      # end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end

      private

      def row
        @row ||= rowset.fetch('row')
      end

      def rowset
        @rowset ||= result.fetch('rowset')
      end
    end
  end
end
