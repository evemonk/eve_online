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
      autoload :CharactersResources, "eve_online/esi/resources/characters_resources"
      autoload :CorporationsResources, "eve_online/esi/resources/corporations_resources"
      autoload :LocationResources, "eve_online/esi/resources/location_resources"
      autoload :RoutesResources, "eve_online/esi/resources/routes_resources"
      autoload :SearchResources, "eve_online/esi/resources/search_resources"
      autoload :ServerStatusResources, "eve_online/esi/resources/server_status_resources"
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
      autoload :Bloodline, "eve_online/esi/models/bloodline"
      autoload :Blueprint, "eve_online/esi/models/blueprint"
      autoload :Character, "eve_online/esi/models/character"
      autoload :CharacterAsset, "eve_online/esi/models/character_asset"
      autoload :CharacterWallet, "eve_online/esi/models/character_wallet"
      autoload :CharacterShip, "eve_online/esi/models/character_ship"
      autoload :Corporation, "eve_online/esi/models/corporation"
      autoload :Defender, "eve_online/esi/models/defender"
      autoload :Faction, "eve_online/esi/models/faction"
      autoload :NpcCorporations, "eve_online/esi/models/npc_corporations"
      autoload :Race, "eve_online/esi/models/race"
      autoload :Route, "eve_online/esi/models/route"
      autoload :Search, "eve_online/esi/models/search"
      autoload :ServerStatus, "eve_online/esi/models/server_status"
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
