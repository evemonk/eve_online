# frozen_string_literal: true

require "eve_online/version"

# Exceptions
require "eve_online/exceptions/base"
require "eve_online/exceptions/timeout"
require "eve_online/exceptions/unauthorized"
require "eve_online/exceptions/resource_not_found"
require "eve_online/exceptions/bad_request"
require "eve_online/exceptions/forbidden"
require "eve_online/exceptions/internal_server_error"
require "eve_online/exceptions/bad_gateway"
require "eve_online/exceptions/service_unavailable"
require "eve_online/exceptions/no_content"
require "eve_online/exceptions/error_limited"

require 'eve_online/eve_online'

module EveOnline
  module ESI
    autoload :Base, "eve_online/esi/base"

    autoload :Alliances, "eve_online/esi/alliances"
    autoload :Alliance, "eve_online/esi/alliance"
    autoload :AllianceCorporations, "eve_online/esi/alliance_corporations"
    autoload :AllianceIcon, "eve_online/esi/alliance_icon"

    autoload :CharacterAssets, "eve_online/esi/character_assets"
    autoload :CharacterAssetsLocations, "eve_online/esi/character_assets_locations"
    autoload :CharacterAssetsNames, "eve_online/esi/character_assets_names"
    autoload :CorporationAssets, "eve_online/esi/corporation_assets"
    autoload :CorporationAssetsLocations, "eve_online/esi/corporation_assets_locations"
    autoload :CorporationAssetsNames, "eve_online/esi/corporation_assets_names"

    autoload :CharacterCalendar, "eve_online/esi/character_calendar"
    autoload :CharacterCalendarEvent, "eve_online/esi/character_calendar_event"

    autoload :Character, "eve_online/esi/character"
    autoload :CharacterBlueprints, "eve_online/esi/character_blueprints"
    autoload :CharacterCorporationHistory, "eve_online/esi/character_corporation_history"
    autoload :CharacterFatigue, "eve_online/esi/character_fatigue"
    autoload :CharacterNotifications, "eve_online/esi/character_notifications"
    autoload :CharacterPortrait, "eve_online/esi/character_portrait"
    autoload :CharacterStandings, "eve_online/esi/character_standings"

    autoload :CharacterClones, "eve_online/esi/character_clones"
    autoload :CharacterImplants, "eve_online/esi/character_implants"

    autoload :CharacterContracts, "eve_online/esi/character_contracts"
    autoload :PublicContracts, "eve_online/esi/public_contracts"
    autoload :PublicContract, "eve_online/esi/public_contract"

    autoload :Corporation, "eve_online/esi/corporation"
    autoload :CorporationAllianceHistory, "eve_online/esi/corporation_alliance_history"
    autoload :CorporationBlueprints, "eve_online/esi/corporation_blueprints"
    autoload :CorporationMembers, "eve_online/esi/corporation_members"
    autoload :CorporationNPC, "eve_online/esi/corporation_npc"

    autoload :DogmaAttributes, "eve_online/esi/dogma_attributes"
    autoload :DogmaAttribute, "eve_online/esi/dogma_attribute"
    autoload :DogmaEffects, "eve_online/esi/dogma_effects"
    autoload :DogmaEffect, "eve_online/esi/dogma_effect"

    autoload :CharacterIndustryJobs, "eve_online/esi/character_industry_jobs"
    autoload :CorporationIndustryJobs, "eve_online/esi/corporation_industry_jobs"

    autoload :CharacterKillmailsRecent, "eve_online/esi/character_killmails_recent"
    autoload :CorporationKillmailsRecent, "eve_online/esi/corporation_killmails_recent"
    autoload :Killmail, "eve_online/esi/killmail"

    autoload :CharacterLocation, "eve_online/esi/character_location"
    autoload :CharacterOnline, "eve_online/esi/character_online"
    autoload :CharacterShip, "eve_online/esi/character_ship"

    autoload :CharacterLoyaltyPoints, "eve_online/esi/character_loyalty_points"
    autoload :CorporationLoyaltyStoreOffers, "eve_online/esi/corporation_loyalty_store_offers"

    # require "eve_online/esi/character_mail_headers"
    # require "eve_online/esi/character_new_mail"
    # require "eve_online/esi/character_delete_mail"
    autoload :CharacterGetMail, "eve_online/esi/character_get_mail"
    # require "eve_online/esi/character_update_mail"
    autoload :CharacterMailLabels, "eve_online/esi/character_mail_labels"
    # require "eve_online/esi/character_new_mail_label"
    # require "eve_online/esi/character_delete_mail_label"
    # require "eve_online/esi/character_mail_lists"

    autoload :CharacterOrders, "eve_online/esi/character_orders"
    autoload :CorporationOrders, "eve_online/esi/corporation_orders"
    autoload :MarketHistory, "eve_online/esi/market_history"
    autoload :MarketGroups, "eve_online/esi/market_groups"
    autoload :MarketGroup, "eve_online/esi/market_group"
    autoload :MarketPrices, "eve_online/esi/market_prices"

    autoload :Search, "eve_online/esi/search"

    autoload :CharacterAttributes, "eve_online/esi/character_attributes"
    autoload :CharacterSkillQueue, "eve_online/esi/character_skill_queue"
    autoload :CharacterSkills, "eve_online/esi/character_skills"

    autoload :ServerStatus, "eve_online/esi/server_status"

    autoload :UniverseAncestries, "eve_online/esi/universe_ancestries"
    autoload :UniverseAsteroidBelt, "eve_online/esi/universe_asteroid_belt"
    autoload :UniverseBloodlines, "eve_online/esi/universe_bloodlines"
    autoload :UniverseCategories, "eve_online/esi/universe_categories"
    autoload :UniverseCategory, "eve_online/esi/universe_category"
    autoload :UniverseConstellations, "eve_online/esi/universe_constellations"
    autoload :UniverseConstellation, "eve_online/esi/universe_constellation"
    autoload :UniverseFactions, "eve_online/esi/universe_factions"
    autoload :UniverseGraphics, "eve_online/esi/universe_graphics"
    autoload :UniverseGraphic, "eve_online/esi/universe_graphic"
    autoload :UniverseGroups, "eve_online/esi/universe_groups"
    autoload :UniverseGroup, "eve_online/esi/universe_group"
    autoload :UniversePlanet, "eve_online/esi/universe_planet"
    autoload :UniverseMoon, "eve_online/esi/universe_moon"
    autoload :UniverseRaces, "eve_online/esi/universe_races"
    autoload :UniverseRegions, "eve_online/esi/universe_regions"
    autoload :UniverseRegion, "eve_online/esi/universe_region"
    autoload :UniverseStargate, "eve_online/esi/universe_stargate"
    autoload :UniverseStar, "eve_online/esi/universe_star"
    autoload :UniverseStation, "eve_online/esi/universe_station"
    autoload :UniverseStructures, "eve_online/esi/universe_structures"
    autoload :UniverseSystemJumps, "eve_online/esi/universe_system_jumps"
    autoload :UniverseSystemKills, "eve_online/esi/universe_system_kills"
    autoload :UniverseSystems, "eve_online/esi/universe_systems"
    autoload :UniverseSystem, "eve_online/esi/universe_system"
    autoload :UniverseTypes, "eve_online/esi/universe_types"
    autoload :UniverseType, "eve_online/esi/universe_type"

    autoload :CharacterWallet, "eve_online/esi/character_wallet"
    autoload :CharacterWalletJournal, "eve_online/esi/character_wallet_journal"
    autoload :CharacterWalletTransactions, "eve_online/esi/character_wallet_transactions"

    autoload :Wars, "eve_online/esi/wars"
    autoload :War, "eve_online/esi/war"
    autoload :WarKillmails, "eve_online/esi/war_killmails"

    module FaradayMiddlewares
      autoload :RaiseErrors, "eve_online/esi/faraday_middlewares/raise_errors"
    end

    module Models
      autoload :Base, "eve_online/esi/models/base"

      autoload :Position, "eve_online/esi/models/position"
      autoload :Coordinates, "eve_online/esi/models/coordinates"
      autoload :LoyaltyPoint, "eve_online/esi/models/loyalty_point"
      autoload :LoyaltyStoreOffer, "eve_online/esi/models/loyalty_store_offer"
      autoload :SkillQueueEntry, "eve_online/esi/models/skill_queue_entry"
      autoload :Skill, "eve_online/esi/models/skill"
      autoload :Asset, "eve_online/esi/models/asset"
      autoload :AssetLocation, "eve_online/esi/models/asset_location"
      autoload :AssetName, "eve_online/esi/models/asset_name"
      autoload :Online, "eve_online/esi/models/online"
      autoload :Attributes, "eve_online/esi/models/attributes"
      autoload :Character, "eve_online/esi/models/character"
      autoload :CharacterCorporationHistory, "eve_online/esi/models/character_corporation_history"
      autoload :CharacterIndustryJob, "eve_online/esi/models/character_industry_job"
      autoload :CorporationIndustryJob, "eve_online/esi/models/corporation_industry_job"
      autoload :CharacterPortrait, "eve_online/esi/models/character_portrait"
      autoload :CharacterOrder, "eve_online/esi/models/character_order"
      autoload :CharacterLocation, "eve_online/esi/models/character_location"
      autoload :CharacterShip, "eve_online/esi/models/character_ship"
      autoload :Blueprint, "eve_online/esi/models/blueprint"
      autoload :Standing, "eve_online/esi/models/standing"
      autoload :Contract, "eve_online/esi/models/contract"
      autoload :PublicContract, "eve_online/esi/models/public_contract"
      autoload :PublicContractItem, "eve_online/esi/models/public_contract_item"
      autoload :Fatigue, "eve_online/esi/models/fatigue"
      autoload :Notification, "eve_online/esi/models/notification"
      autoload :Event, "eve_online/esi/models/event"
      autoload :EventDetails, "eve_online/esi/models/event_details"
      autoload :Type, "eve_online/esi/models/type"
      autoload :JumpClone, "eve_online/esi/models/jump_clone"
      autoload :WalletJournal, "eve_online/esi/models/wallet_journal"
      autoload :WalletTransaction, "eve_online/esi/models/wallet_transaction"
      autoload :CorporationOrder, "eve_online/esi/models/corporation_order"
      autoload :HomeLocation, "eve_online/esi/models/home_location"
      autoload :Search, "eve_online/esi/models/search"
      autoload :ServerStatus, "eve_online/esi/models/server_status"

      autoload :MarketHistory, "eve_online/esi/models/market_history"
      autoload :MarketGroup, "eve_online/esi/models/market_group"
      autoload :MarketPrice, "eve_online/esi/models/market_price"

      autoload :Corporation, "eve_online/esi/models/corporation"
      autoload :CorporationAllianceHistory, "eve_online/esi/models/corporation_alliance_history"

      autoload :Alliance, "eve_online/esi/models/alliance"
      autoload :AllianceShort, "eve_online/esi/models/alliance_short"
      autoload :AllianceIcon, "eve_online/esi/models/alliance_icon"

      autoload :OfferRequiredItem, "eve_online/esi/models/offer_required_item"
      autoload :OfferRequiredItems, "eve_online/esi/models/offer_required_items"

      # require "eve_online/esi/models/mail_header"
      autoload :MailRecipient, "eve_online/esi/models/mail_recipient"
      autoload :MailRecipients, "eve_online/esi/models/mail_recipients"
      autoload :Mail, "eve_online/esi/models/mail"
      autoload :MailLabel, "eve_online/esi/models/mail_label"

      autoload :DogmaAttribute, "eve_online/esi/models/dogma_attribute"
      autoload :DogmaAttributes, "eve_online/esi/models/dogma_attributes"
      autoload :DogmaAttributeShort, "eve_online/esi/models/dogma_attribute_short"
      autoload :DogmaEffect, "eve_online/esi/models/dogma_effect"
      autoload :DogmaEffects, "eve_online/esi/models/dogma_effects"
      autoload :DogmaEffectShort, "eve_online/esi/models/dogma_effect_short"
      autoload :DogmaEffectModifier, "eve_online/esi/models/dogma_effect_modifier"
      autoload :DogmaEffectModifiers, "eve_online/esi/models/dogma_effect_modifiers"

      autoload :Race, "eve_online/esi/models/race"
      autoload :Bloodline, "eve_online/esi/models/bloodline"
      autoload :Faction, "eve_online/esi/models/faction"
      autoload :Ancestry, "eve_online/esi/models/ancestry"
      autoload :Region, "eve_online/esi/models/region"
      autoload :Constellation, "eve_online/esi/models/constellation"
      autoload :Category, "eve_online/esi/models/category"
      autoload :Group, "eve_online/esi/models/group"
      autoload :Graphic, "eve_online/esi/models/graphic"
      autoload :System, "eve_online/esi/models/system"
      autoload :PlanetShort, "eve_online/esi/models/planet_short"
      autoload :Planets, "eve_online/esi/models/planets"
      autoload :Planet, "eve_online/esi/models/planet"
      autoload :AsteroidBelt, "eve_online/esi/models/asteroid_belt"
      autoload :Moon, "eve_online/esi/models/moon"
      autoload :SystemJump, "eve_online/esi/models/system_jump"
      autoload :SystemKill, "eve_online/esi/models/system_kill"
      autoload :Stargate, "eve_online/esi/models/stargate"
      autoload :Star, "eve_online/esi/models/star"
      autoload :Station, "eve_online/esi/models/station"

      autoload :War, "eve_online/esi/models/war"
      autoload :Aggressor, "eve_online/esi/models/aggressor"
      autoload :Ally, "eve_online/esi/models/ally"
      autoload :Allies, "eve_online/esi/models/allies"
      autoload :Defender, "eve_online/esi/models/defender"
      autoload :KillmailShort, "eve_online/esi/models/killmail_short"
      autoload :Killmail, "eve_online/esi/models/killmail"
    end
  end

  module Formulas
    autoload :BlueprintCopyTime, "eve_online/formulas/blueprint_copy_time"
    autoload :TrainingRate, "eve_online/formulas/training_rate"
  end
end
