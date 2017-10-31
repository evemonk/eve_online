module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_charactersheet.html
    class CharacterSheet < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/CharacterSheet.xml.aspx'.freeze

      ACCESS_MASK = 8

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
      end

      def as_json
        {
          id: id,
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

      def id
        result.fetch('characterID').to_i
      end

      def name
        result.fetch('name')
      end

      def home_station_id
        result.fetch('homeStationID').to_i
      end

      def dob
        parse_datetime_with_timezone(result.fetch('DoB'))
      end

      def race
        result.fetch('race')
      end

      def blood_line_id
        result.fetch('bloodLineID').to_i
      end

      def blood_line
        result.fetch('bloodLine')
      end

      def ancestry_id
        result.fetch('ancestryID').to_i
      end

      def ancestry
        result.fetch('ancestry')
      end

      def gender
        result.fetch('gender').downcase.to_sym
      end

      def corporation_name
        result.fetch('corporationName')
      end

      def corporation_id
        result.fetch('corporationID').to_i
      end

      def alliance_name
        # TODO: Corporation "Federal Navy Academy" doesn't have allianceName in response
        result.fetch('allianceName')
      end

      def alliance_id
        # TODO: Corporation "Federal Navy Academy" doesn't have allianceID in response
        result.fetch('allianceID').to_i
      end

      def faction_name
        # TODO: Corporation "Federal Navy Academy" doesn't have factionName in response
        result.fetch('factionName')
      end

      def faction_id
        # TODO: Corporation "Federal Navy Academy" doesn't have factionID in response
        result.fetch('factionID').to_i
      end

      def clone_type_id
        result.fetch('cloneTypeID').to_i
      end

      def clone_name
        result.fetch('cloneName')
      end

      def clone_skill_points
        result.fetch('cloneSkillPoints').to_i
      end

      def free_skill_points
        result.fetch('freeSkillPoints').to_i
      end

      def free_respecs
        result.fetch('freeRespecs').to_i
      end

      def clone_jump_date
        parse_datetime_with_timezone(result.fetch('cloneJumpDate'))
      end

      def last_respec_date
        parse_datetime_with_timezone(result.fetch('lastRespecDate'))
      end

      def last_timed_respec
        parse_datetime_with_timezone(result.fetch('lastTimedRespec'))
      end

      def remote_station_date
        parse_datetime_with_timezone(result.fetch('remoteStationDate'))
      end

      # TODO: add to as_json output
      def jump_activation
        parse_datetime_with_timezone(result.fetch('jumpActivation'))
      end

      # TODO: add to as_json output
      def jump_fatigue
        parse_datetime_with_timezone(result.fetch('jumpFatigue'))
      end

      # TODO: add to as_json output
      def jump_last_update
        parse_datetime_with_timezone(result.fetch('jumpLastUpdate'))
      end

      # TODO: add to as_json output
      def intelligence
        attributes.fetch('intelligence').to_i
      end

      # TODO: add to as_json output
      def memory
        attributes.fetch('memory').to_i
      end

      # TODO: add to as_json output
      def charisma
        attributes.fetch('charisma').to_i
      end

      # TODO: add to as_json output
      def perception
        attributes.fetch('perception').to_i
      end

      # TODO: add to as_json output
      def willpower
        attributes.fetch('willpower').to_i
      end

      def implants
        CharacterImplants.new(result).implants
      end
      memoize :implants

      def skills
        CharacterSkills.new(result).skills
      end
      memoize :skills

      def jump_clones
        CharacterJumpClones.new(result).jump_clones
      end
      memoize :jump_clones

      def jump_clone_implants
        CharacterJumpCloneImplants.new(result).jump_clone_implants
      end
      memoize :jump_clone_implants

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end

      private

      def attributes
        result.fetch('attributes')
      end
      memoize :attributes
    end
  end
end
