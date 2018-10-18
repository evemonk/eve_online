# frozen_string_literal: true

require 'eve_online/version'

# Exceptions
require 'eve_online/exceptions/base'
require 'eve_online/exceptions/timeout'
require 'eve_online/exceptions/unauthorized'
require 'eve_online/exceptions/resource_not_found'
require 'eve_online/exceptions/bad_request'
require 'eve_online/exceptions/forbidden'
require 'eve_online/exceptions/internal_server_error'
require 'eve_online/exceptions/bad_gateway'
require 'eve_online/exceptions/service_unavailable'
require 'eve_online/exceptions/no_content'

# ESI API
require 'eve_online/esi/base'

require 'eve_online/esi/alliances'
require 'eve_online/esi/alliance'
require 'eve_online/esi/alliance_corporations'
require 'eve_online/esi/alliance_icon'

require 'eve_online/esi/character_assets'
require 'eve_online/esi/character_assets_locations'
require 'eve_online/esi/character_assets_names'

require 'eve_online/esi/character_bookmarks'
require 'eve_online/esi/character_bookmark_folders'

require 'eve_online/esi/character_calendar'

require 'eve_online/esi/character'
require 'eve_online/esi/character_blueprints'
require 'eve_online/esi/character_fatigue'
require 'eve_online/esi/character_notifications'
require 'eve_online/esi/character_portrait'
require 'eve_online/esi/character_standings'

require 'eve_online/esi/character_clones'
require 'eve_online/esi/character_implants'

require 'eve_online/esi/corporation'
require 'eve_online/esi/corporation_blueprints'

require 'eve_online/esi/dogma_attributes'
require 'eve_online/esi/dogma_attribute'
require 'eve_online/esi/dogma_effects'
require 'eve_online/esi/dogma_effect'

require 'eve_online/esi/character_industry_jobs'
require 'eve_online/esi/corporation_industry_jobs'

require 'eve_online/esi/character_killmails_recent'
require 'eve_online/esi/corporation_killmails_recent'

require 'eve_online/esi/character_location'
require 'eve_online/esi/character_online'
require 'eve_online/esi/character_ship'

require 'eve_online/esi/character_loyalty_points'

require 'eve_online/esi/character_orders'
require 'eve_online/esi/corporation_orders'
require 'eve_online/esi/market_history'

require 'eve_online/esi/character_attributes'
require 'eve_online/esi/character_skill_queue'
require 'eve_online/esi/character_skills'

require 'eve_online/esi/server_status'

require 'eve_online/esi/ancestries'
require 'eve_online/esi/universe_asteroid_belt'
require 'eve_online/esi/bloodlines'
require 'eve_online/esi/universe_categories'
require 'eve_online/esi/universe_category'
require 'eve_online/esi/universe_constellations'
require 'eve_online/esi/universe_constellation'
require 'eve_online/esi/factions'
require 'eve_online/esi/universe_graphics'
require 'eve_online/esi/universe_graphic'
require 'eve_online/esi/universe_groups'
require 'eve_online/esi/universe_group'
require 'eve_online/esi/universe_planet'
require 'eve_online/esi/universe_moon'
require 'eve_online/esi/races'
require 'eve_online/esi/universe_regions'
require 'eve_online/esi/universe_region'
require 'eve_online/esi/universe_structures'
require 'eve_online/esi/universe_system_jumps'
require 'eve_online/esi/universe_system_kills'
require 'eve_online/esi/universe_systems'
require 'eve_online/esi/universe_system'
require 'eve_online/esi/universe_types'
require 'eve_online/esi/universe_type'

require 'eve_online/esi/character_wallet'
require 'eve_online/esi/character_wallet_journal'

require 'eve_online/esi/wars'
require 'eve_online/esi/war_killmails'

# Models
require 'eve_online/esi/models/base'
require 'eve_online/esi/models/position'
require 'eve_online/esi/models/loyalty_point'
require 'eve_online/esi/models/skill_queue_entry'
require 'eve_online/esi/models/skill'
require 'eve_online/esi/models/asset'
require 'eve_online/esi/models/asset_location'
require 'eve_online/esi/models/asset_name'
require 'eve_online/esi/models/online'
require 'eve_online/esi/models/attributes'
require 'eve_online/esi/models/character'
require 'eve_online/esi/models/character_industry_job'
require 'eve_online/esi/models/corporation_industry_job'
require 'eve_online/esi/models/character_portrait'
require 'eve_online/esi/models/character_order'
require 'eve_online/esi/models/character_location'
require 'eve_online/esi/models/character_ship'
require 'eve_online/esi/models/blueprint'
require 'eve_online/esi/models/bookmark'
require 'eve_online/esi/models/bookmark_folder'
require 'eve_online/esi/models/standing'
require 'eve_online/esi/models/fatigue'
require 'eve_online/esi/models/notification'
require 'eve_online/esi/models/event'
require 'eve_online/esi/models/type'
require 'eve_online/esi/models/jump_clone'
require 'eve_online/esi/models/wallet_journal_entry'
require 'eve_online/esi/models/corporation_order'
require 'eve_online/esi/models/home_location'
require 'eve_online/esi/models/server_status'

require 'eve_online/esi/models/market_history'

require 'eve_online/esi/models/corporation'

require 'eve_online/esi/models/alliance'
require 'eve_online/esi/models/alliance_short'
require 'eve_online/esi/models/alliance_icon'

require 'eve_online/esi/models/dogma_attribute'
require 'eve_online/esi/models/dogma_attributes'
require 'eve_online/esi/models/dogma_attribute_short'
require 'eve_online/esi/models/dogma_effect'
require 'eve_online/esi/models/dogma_effects'
require 'eve_online/esi/models/dogma_effect_short'
require 'eve_online/esi/models/dogma_effect_modifier'
require 'eve_online/esi/models/dogma_effect_modifiers'

require 'eve_online/esi/models/race'
require 'eve_online/esi/models/bloodline'
require 'eve_online/esi/models/faction'
require 'eve_online/esi/models/ancestry'
require 'eve_online/esi/models/region'
require 'eve_online/esi/models/constellation'
require 'eve_online/esi/models/category'
require 'eve_online/esi/models/group'
require 'eve_online/esi/models/graphic'
require 'eve_online/esi/models/system'
require 'eve_online/esi/models/planet_short'
require 'eve_online/esi/models/planets'
require 'eve_online/esi/models/planet'
require 'eve_online/esi/models/asteroid_belt'
require 'eve_online/esi/models/moon'
require 'eve_online/esi/models/system_jump'
require 'eve_online/esi/models/system_kill'
require 'eve_online/esi/models/stargate_destination'

require 'eve_online/esi/models/killmail_short'

module EveOnline
end
