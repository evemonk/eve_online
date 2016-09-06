module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html
    class Standings < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/Standings.xml.aspx'.freeze

      ACCESS_MASK = 524_288

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def agents
        output = []
        agents_rowset.each do |agent|
          output << Standing.new(agent)
        end
        output
      end

      def npc_corporations
        output = []
        npc_corporations_rowset.each do |agent|
          output << Standing.new(agent)
        end
        output
      end

      def factions
        output = []
        factions_rowset.each do |agent|
          output << Standing.new(agent)
        end
        output
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
      memoize :url

      private

      def agents_rowset
        result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'agents' }.first.fetch('row')
      end

      def npc_corporations_rowset
        result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'NPCCorporations' }.first.fetch('row')
      end

      def factions_rowset
        result.fetch('characterNPCStandings').fetch('rowset').reject { |a| a.fetch('@name') != 'factions' }.first.fetch('row')
      end
    end
  end
end
