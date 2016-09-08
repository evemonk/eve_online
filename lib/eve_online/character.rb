module EveOnline
  class Character
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        character_id: character_id,
        character_name: character_name,
        corporation_id: corporation_id,
        corporation_name: corporation_name,
        alliance_id: alliance_id,
        alliance_name: alliance_name,
        faction_id: faction_id,
        faction_name: faction_name
      }
    end

    def character_id
      options.fetch('@characterID').to_i
    end

    def character_name
      options.fetch('@name', nil) || options.fetch('@characterName')
    end

    def corporation_id
      options.fetch('@corporationID').to_i
    end

    def corporation_name
      options.fetch('@corporationName')
    end

    def alliance_id
      options.fetch('@allianceID').to_i
    end

    def alliance_name
      options.fetch('@allianceName')
    end

    def faction_id
      options.fetch('@factionID').to_i
    end

    def faction_name
      options.fetch('@factionName')
    end
  end
end
