module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html
    class Standings < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/Standings.xml.aspx'.freeze

      ACCESS_MASK = 524288

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def agents
        @agents ||= begin
          output = []
          agents_rowset.each do |agent|
            output << Standing.new(agent)
          end
          output
        end
      end

      def npc_corporations
        @npc_corporations ||= begin
          output = []
          npc_corporations_rowset.each do |agent|
            output << Standing.new(agent)
          end
          output
        end
      end

      def factions
        @factions ||= begin
          output = []
          factions_rowset.each do |agent|
            output << Standing.new(agent)
          end
          output
        end
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end

      private

      def agents_rowset
        @agents_rowset ||= result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'agents' }.first.fetch('row')
      end

      def npc_corporations_rowset
        @npc_corporations_rowset ||= result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'NPCCorporations' }.first.fetch('row')
      end

      def factions_rowset
        @factions_rowset ||= result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'factions' }.first.fetch('row')
      end
    end
  end
end
