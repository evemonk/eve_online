module EveOnline
  class Character
    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def as_json(*args)
      {
        character_id: character_id,
        name: name,
        corporation_name: corporation_name,
        corporation_id: corporation_id,
        alliance_id: alliance_id,
        alliance_name: alliance_name,
        faction_name: faction_name,
        faction_id: faction_id
      }
    end

    def character_id
      @character_id ||= options.fetch('@characterID').to_i
    end

    def name
      @name ||= options.fetch('@name')
    end

    def corporation_name
      @corporation_name ||= options.fetch('@corporationName')
    end

    def corporation_id
      @corporation_id ||= options.fetch('@corporationID').to_i
    end

    def alliance_id
      @alliance_id ||= options.fetch('@allianceID').to_i
    end

    def alliance_name
      @alliance_name ||= options.fetch('@allianceName')
    end

    def faction_id
      @faction_id ||= options.fetch('@factionID').to_i
    end

    def faction_name
      @faction_name ||= options.fetch('@factionName')
    end
  end
end
