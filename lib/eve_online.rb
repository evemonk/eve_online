require 'eve_online/version'

require 'eve_online/exceptions/base'
require 'eve_online/exceptions/timeout_exception'
require 'eve_online/exceptions/unauthorized_exception'
require 'eve_online/exceptions/invalid_character_id_exception'

require 'eve_online/base'
require 'eve_online/base_xml'

require 'eve_online/bookmark'
require 'eve_online/bookmark_folder'
require 'eve_online/event'
require 'eve_online/event_response_object'
require 'eve_online/contact_notification'
require 'eve_online/wallet_journal_entry'
require 'eve_online/market_order'

# XML API
require 'eve_online/xml/base'
require 'eve_online/xml/character_bookmarks'
require 'eve_online/xml/character_contact_notifications'
require 'eve_online/xml/character_upcoming_calendar_events'
require 'eve_online/xml/character_wallet_journal'

require 'eve_online/xml/corporation_market_orders'

# ESI API
require 'eve_online/esi/base'

require 'eve_online/esi/character'
require 'eve_online/esi/character_portrait'
require 'eve_online/esi/character_skills'
require 'eve_online/esi/character_skill_queue'
require 'eve_online/esi/character_loyalty_points'
require 'eve_online/esi/character_wallet'
require 'eve_online/esi/character_assets'
require 'eve_online/esi/character_attributes'
require 'eve_online/esi/character_industry_jobs'
require 'eve_online/esi/character_clones'
require 'eve_online/esi/character_implants'
require 'eve_online/esi/character_blueprints'
require 'eve_online/esi/character_standings'
require 'eve_online/esi/character_fatigue'
require 'eve_online/esi/character_online'
require 'eve_online/esi/character_orders'

require 'eve_online/esi/market_history'

require 'eve_online/esi/corporation'
require 'eve_online/esi/corporation_industry_jobs'
require 'eve_online/esi/corporation_blueprints'

require 'eve_online/esi/alliances'
require 'eve_online/esi/alliance'
require 'eve_online/esi/alliance_corporations'
require 'eve_online/esi/alliance_icon'
require 'eve_online/esi/alliances_names'

require 'eve_online/esi/dogma_attributes'
require 'eve_online/esi/dogma_attribute'

require 'eve_online/esi/server_status'
require 'eve_online/esi/races'
require 'eve_online/esi/bloodlines'
require 'eve_online/esi/factions'

require 'eve_online/esi/models/base'
require 'eve_online/esi/models/loyalty_point'
require 'eve_online/esi/models/skill_queue_entry'
require 'eve_online/esi/models/skill'
require 'eve_online/esi/models/asset'
require 'eve_online/esi/models/online'
require 'eve_online/esi/models/attributes'
require 'eve_online/esi/models/character'
require 'eve_online/esi/models/industry_job'
require 'eve_online/esi/models/character_portrait'
require 'eve_online/esi/models/character_order'
require 'eve_online/esi/models/blueprint'
require 'eve_online/esi/models/standing'
require 'eve_online/esi/models/fatigue'
require 'eve_online/esi/models/jump_clone'
require 'eve_online/esi/models/home_location'
require 'eve_online/esi/models/server_status'

require 'eve_online/esi/models/market_history'

require 'eve_online/esi/models/corporation'

require 'eve_online/esi/models/alliance'
require 'eve_online/esi/models/alliance_short'
require 'eve_online/esi/models/alliance_icon'

require 'eve_online/esi/models/dogma_attribute'

require 'eve_online/esi/models/race'
require 'eve_online/esi/models/bloodline'
require 'eve_online/esi/models/faction'

# SDE
require 'eve_online/sde/base'

require 'eve_online/sde/agt_agent_types'
require 'eve_online/sde/agt_agents'
require 'eve_online/sde/agt_research_agents'
require 'eve_online/sde/inv_flags'
require 'eve_online/sde/inv_items'
require 'eve_online/sde/inv_names'
require 'eve_online/sde/inv_positions'

require 'eve_online/sde/models/agt_agent_type'
require 'eve_online/sde/models/agt_agent'
require 'eve_online/sde/models/agt_research_agent'
require 'eve_online/sde/models/inv_flag'
require 'eve_online/sde/models/inv_item'
require 'eve_online/sde/models/inv_name'
require 'eve_online/sde/models/inv_position'

module EveOnline
end
