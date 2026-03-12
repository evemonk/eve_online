# frozen_string_literal: true

require "faraday"

require "eve_online/version"
require "eve_online/exceptions"

module EveOnline
  module ESI
    autoload :Client, "eve_online/esi/client"
    autoload :Object, "eve_online/esi/object"
    autoload :Collection, "eve_online/esi/collection"
    autoload :Middleware, "eve_online/esi/middleware"
    autoload :ParsedHeaders, "eve_online/esi/parsed_headers"

    module Resources
      autoload :Resource, "eve_online/esi/resources/resource"

      # Sort alphabetically
      autoload :AlliancesResources, "eve_online/esi/resources/alliances_resources"
      autoload :AssetsResources, "eve_online/esi/resources/assets_resources"
      autoload :CalendarsResources, "eve_online/esi/resources/calendars_resources"
      autoload :CharactersResources, "eve_online/esi/resources/characters_resources"
      autoload :ClonesResources, "eve_online/esi/resources/clones_resources"
      autoload :CorporationsResources, "eve_online/esi/resources/corporations_resources"
      autoload :LocationResources, "eve_online/esi/resources/location_resources"
      autoload :RoutesResources, "eve_online/esi/resources/routes_resources"
      autoload :SearchResources, "eve_online/esi/resources/search_resources"
      autoload :ServerStatusResources, "eve_online/esi/resources/server_status_resources"
      autoload :SkillsResources, "eve_online/esi/resources/skills_resources"
      autoload :UniverseResources, "eve_online/esi/resources/universe_resources"
      autoload :WalletResources, "eve_online/esi/resources/wallet_resources"
      autoload :WarsResources, "eve_online/esi/resources/wars_resources"
    end

    module Models
      # Sort alphabetically
      autoload :Aggressor, "eve_online/esi/models/aggressor"
      autoload :Alliance, "eve_online/esi/models/alliance"
      autoload :AllianceIcon, "eve_online/esi/models/alliance_icon"
      autoload :AllianceCorporations, "eve_online/esi/models/alliance_corporations"
      autoload :Alliances, "eve_online/esi/models/alliances"
      autoload :Ally, "eve_online/esi/models/ally"
      autoload :Ancestry, "eve_online/esi/models/ancestry"
      autoload :AsteroidBelt, "eve_online/esi/models/asteroid_belt"
      autoload :Attributes, "eve_online/esi/models/attributes"
      autoload :Bloodline, "eve_online/esi/models/bloodline"
      autoload :Blueprint, "eve_online/esi/models/blueprint"
      autoload :Categories, "eve_online/esi/models/categories"
      autoload :Category, "eve_online/esi/models/category"
      autoload :Character, "eve_online/esi/models/character"
      autoload :CharacterAsset, "eve_online/esi/models/character_asset"
      autoload :CharacterWallet, "eve_online/esi/models/character_wallet"
      autoload :CharacterShip, "eve_online/esi/models/character_ship"
      autoload :Clones, "eve_online/esi/models/clones"
      autoload :Constellation, "eve_online/esi/models/constellation"
      autoload :Constellations, "eve_online/esi/models/constellations"
      autoload :Corporation, "eve_online/esi/models/corporation"
      autoload :Defender, "eve_online/esi/models/defender"
      autoload :Destination, "eve_online/esi/models/destination"
      autoload :Faction, "eve_online/esi/models/faction"
      autoload :Group, "eve_online/esi/models/group"
      autoload :Groups, "eve_online/esi/models/groups"
      autoload :HomeLocation, "eve_online/esi/models/home_location"
      autoload :Implants, "eve_online/esi/models/implants"
      autoload :JumpClone, "eve_online/esi/models/jump_clone"
      autoload :Moon, "eve_online/esi/models/moon"
      autoload :NpcCorporations, "eve_online/esi/models/npc_corporations"
      autoload :Planet, "eve_online/esi/models/planet"
      autoload :PlanetShort, "eve_online/esi/models/planet_short"
      autoload :Position, "eve_online/esi/models/position"
      autoload :Race, "eve_online/esi/models/race"
      autoload :Region, "eve_online/esi/models/region"
      autoload :Regions, "eve_online/esi/models/regions"
      autoload :Route, "eve_online/esi/models/route"
      autoload :Search, "eve_online/esi/models/search"
      autoload :ServerStatus, "eve_online/esi/models/server_status"
      autoload :Skill, "eve_online/esi/models/skill"
      autoload :Skills, "eve_online/esi/models/skills"
      autoload :Star, "eve_online/esi/models/star"
      autoload :Stargate, "eve_online/esi/models/stargate"
      autoload :SkillQueueEntry, "eve_online/esi/models/skill_queue_entry"
      autoload :System, "eve_online/esi/models/system"
      autoload :Station, "eve_online/esi/models/station"
      autoload :Systems, "eve_online/esi/models/systems"
      autoload :War, "eve_online/esi/models/war"
      autoload :Wars, "eve_online/esi/models/wars"
    end

    module FaradayMiddlewares
      autoload :RaiseErrors, "eve_online/esi/faraday_middlewares/raise_errors"
      autoload :ParseEveDates, "eve_online/esi/faraday_middlewares/parse_eve_dates"
    end

    Faraday::Response.register_middleware(esi_raise_errors: FaradayMiddlewares::RaiseErrors)
    Faraday::Response.register_middleware(esi_parse_eve_dates: FaradayMiddlewares::ParseEveDates)
  end

  module Formulas
    autoload :BlueprintCopyTime, "eve_online/formulas/blueprint_copy_time"
    autoload :TrainingRate, "eve_online/formulas/training_rate"
  end
end
