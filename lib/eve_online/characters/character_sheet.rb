module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_charactersheet.html
    class CharacterSheet < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/CharacterSheet.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def as_json
        {
          character_id: character_id,
          name: name,
          home_station_id: home_station_id,
          dob: dob,
          race: race,
          blood_line_id: blood_line_id,
          blood_line: blood_line,
          ancestry_id: ancestry_id,
          ancestry: ancestry,
          gender: gender,
          corporation_name: corporation_name,
          corporation_id: corporation_id,
          alliance_name: alliance_name,
          alliance_id: alliance_id,
          faction_name: faction_name,
          faction_id: faction_id,
          clone_type_id: clone_type_id,
          clone_name: clone_name,
          clone_skill_points: clone_skill_points,
          free_skill_points: free_skill_points,
          free_respecs: free_respecs,
          clone_jump_date: clone_jump_date,
          last_respec_date: last_respec_date,
          last_timed_respec: last_timed_respec,
          remote_station_date: remote_station_date
        }
      end

      def name
        @name ||= result.fetch('name')
      end

      def home_station_id
        @home_station_id ||= result.fetch('homeStationID').to_i
      end

      def dob
        @dob ||= parse_datetime_with_timezone(result.fetch('DoB'))
      end

      def race
        @race ||= result.fetch('race')
      end

      def blood_line_id
        @blood_line_id ||= result.fetch('bloodLineID').to_i
      end

      def blood_line
        @blood_line ||= result.fetch('bloodLine')
      end

      def ancestry_id
        @ancestry_id ||= result.fetch('ancestryID').to_i
      end

      def ancestry
        @ancestry ||= result.fetch('ancestry')
      end

      def gender
        @gender ||= result.fetch('gender').downcase.to_sym
      end

      def corporation_name
        @corporation_name ||= result.fetch('corporationName')
      end

      def corporation_id
        @corporation_id ||= result.fetch('corporationID').to_i
      end

      def alliance_name
        # TODO: Corporation "Federal Navy Academy" doesn't have allianceName in response
        @alliance_name ||= result.fetch('allianceName')
      end

      def alliance_id
        # TODO: Corporation "Federal Navy Academy" doesn't have allianceID in response
        @alliance_id ||= result.fetch('allianceID').to_i
      end

      def faction_name
        # TODO: Corporation "Federal Navy Academy" doesn't have factionName in response
        @faction_name ||= result.fetch('factionName')
      end

      def faction_id
        # TODO: Corporation "Federal Navy Academy" doesn't have factionID in response
        @faction_id ||= result.fetch('factionID').to_i
      end

      def clone_type_id
        @clone_type_id ||= result.fetch('cloneTypeID').to_i
      end

      def clone_name
        @clone_name ||= result.fetch('cloneName')
      end

      def clone_skill_points
        @clone_skill_points ||= result.fetch('cloneSkillPoints').to_i
      end

      def free_skill_points
        @free_skill_points ||= result.fetch('freeSkillPoints').to_i
      end

      def free_respecs
        @free_respecs ||= result.fetch('freeRespecs').to_i
      end

      def clone_jump_date
        @clone_jump_date ||= parse_datetime_with_timezone(result.fetch('cloneJumpDate'))
      end

      def last_respec_date
        @last_respec_date ||= parse_datetime_with_timezone(result.fetch('lastRespecDate'))
      end

      def last_timed_respec
        @last_timed_respec ||= parse_datetime_with_timezone(result.fetch('lastTimedRespec'))
      end

      def remote_station_date
        @remote_station_date ||= parse_datetime_with_timezone(result.fetch('remoteStationDate'))
      end

      def jump_activation
        @jump_activation ||= parse_datetime_with_timezone(result.fetch('jumpActivation'))
      end

      def jump_fatigue
        @jump_fatigue ||= parse_datetime_with_timezone(result.fetch('jumpFatigue'))
      end

      def jump_last_update
        @jump_last_update ||= parse_datetime_with_timezone(result.fetch('jumpLastUpdate'))
      end

      def balance
        @balance ||= result.fetch('balance')
      end

      def base_intelligence
        @intelligence ||= attributes.fetch('intelligence').to_i
      end

      def base_memory
        @memory ||= attributes.fetch('memory').to_i
      end

      def base_charisma
        @charisma ||= attributes.fetch('charisma').to_i
      end

      def base_perception
        @perception ||= attributes.fetch('perception').to_i
      end

      def base_willpower
        @willpower ||= attributes.fetch('willpower').to_i
      end

      def implants
        output = []
        implants_rows.each do |implant|
          output << Implant.new(implant)
        end
        output
      end

      def skills
        output = []
        skills_rows.each do |skill|
          output << Skill.new(skill)
        end
        output
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end

      private

      def attributes
        @attributes ||= result.fetch('attributes')
      end

      # TODO: spec this
      def implants_rows
        @implants_rows ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'implants' }.first.fetch('row')
      end

      # TODO: spec this
      def skills_rows
        @skills_rows ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'skills' }.first.fetch('row')
      end

      # TODO: spec this
      def jump_clones_rows
        @jump_clones_rows ||= result.fetch('rowset').reject { |a| a.fetch('@name') != 'jumpClones' }.first.fetch('row')
      end
    end
  end
end
