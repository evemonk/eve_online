# EveOnline ESI API

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Gem Downloads](https://img.shields.io/gem/dt/eve_online.svg)](https://rubygems.org/gems/eve_online)
[![DeepSource](https://static.deepsource.io/deepsource-badge-light-mini.svg)](https://deepsource.io/gh/evemonk/eve_online/?ref=repository-badge)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

This gem implement Ruby API for EveOnline MMORPG (ESI).

Looking for [EveOnline SSO OAuth2 Strategy for OmniAuth](https://github.com/evemonk/omniauth-eve_online-sso)?

This gem was extracted from [EveMonk](https://evemonk.com). Source code of EveMonk backend published [here](https://github.com/evemonk/evemonk).

[API Documentation for latest release at rubydoc](https://rubydoc.info/gems/eve_online/frames).

## TOC

* [Installation](#installation)
* [Supported ruby versions](#supported-ruby-versions)
* [Supported rails versions](#supported-rails-versions)
* [Usage examples](#usage-examples)
  * [Alliance](#alliance)
    * [List all alliances](#list-all-alliances)
    * [Get alliance information](#get-alliance-information)
    * [List alliance's corporations](#list-alliances-corporations)
    * [Get alliance icon](#get-alliance-icon)
  * [Assets](#assets)
    * [Get character assets](#get-character-assets)
    * [Get character asset locations](#get-character-asset-locations)
    * [Get character asset names](#get-character-asset-names)
    * [Get corporation assets](#get-corporation-assets)
    * [Get corporation asset locations](#get-corporation-asset-locations)
    * [Get corporation asset names](#get-corporation-asset-names)
  * [Bookmarks](#bookmarks)
    * [List bookmarks](#list-bookmarks)
    * [List bookmark folders](#list-bookmark-folders)
    * [List corporation bookmarks](#list-corporation-bookmarks)
    * [List corporation bookmark folders](#list-corporation-bookmark-folders)
  * [Calendar](#calendar)
    * [List calendar event summaries](#list-calendar-event-summaries)
    * [Get an event](#get-an-event)
    * [Respond to an event](#respond-to-an-event)
    * [Get attendees](#get-attendees)
  * [Character](#character)
    * [Get character's public information](#get-characters-public-information)
    * [Get agents research](#get-agents-research)
    * [Get blueprints](#get-blueprints)
    * [Get corporation history](#get-corporation-history)
    * [Calculate a CSPA charge cost](#calculate-a-cspa-charge-cost)
    * [Get jump fatigue](#get-jump-fatigue)
    * [Get medals](#get-medals)
    * [Get character notifications](#get-character-notifications)
    * [Get new contact notifications](#get-new-contact-notifications)
    * [Get character portraits](#get-character-portraits)
    * [Get character corporation roles](#get-character-corporation-roles)
    * [Get standings](#get-standings)
    * [Yearly aggregate stats](#yearly-aggregate-stats)
    * [Get character corporation titles](#get-character-corporation-titles)
    * [Character affiliation](#character-affiliation)
  * [Clones](#clones)
    * [Get clones](#get-clones)
    * [Get active implants](#get-active-implants)
  * [Contacts](#contacts)
    * [Get alliance contacts](#get-alliance-contacts)
    * [Get alliance contact labels](#get-alliance-contact-labels)
    * [Delete contacts](#delete-contacts)
    * [Get contacts](#get-contacts)
    * [Add contacts](#add-contacts)
    * [Edit contacts](#edit-contacts)
    * [Get contact labels](#get-contact-labels)
    * [Get corporation contacts](#get-corporation-contacts)
    * [Get corporation contact labels](#get-corporation-contact-labels)
  * [Contracts](#contracts)
    * [Get contracts](#get-contracts)
    * [Get contract bids](#get-contract-bids)
    * [Get contract items](#get-contract-items)
    * [Get public contracts](#get-public-contracts)
    * [Get public contract bids](#get-public-contract-bids)
    * [Get public contract items](#get-public-contract-items)
    * [Get corporation contracts](#get-corporation-contracts)
    * [Get corporation contract bids](#get-corporation-contract-bids)
    * [Get corporation contract items](#get-corporation-contract-items)
  * [Corporation](#corporation)
    * [Get corporation information](#get-corporation-information)
    * [Get alliance history](#get-alliance-history)
    * [Get corporation blueprints](#get-corporation-blueprints)
    * [Get all corporation ALSC logs](#get-all-corporation-alsc-logs)
    * [Get corporation divisions](#get-corporation-divisions)
    * [Get corporation facilities](#get-corporation-facilities)
    * [Get corporation icon](#get-corporation-icon)
    * [Get corporation medals](#get-corporation-medals)
    * [Get corporation issued medals](#get-corporation-issued-medals)
    * [Get corporation members](#get-corporation-members)
    * [Get corporation member limit](#get-corporation-member-limit)
    * [Get corporation's members' titles](#get-corporations-members-titles)
    * [Track corporation members](#track-corporation-members)
    * [Get corporation member roles](#get-corporation-member-roles)
    * [Get corporation member roles history](#get-corporation-member-roles-history)
    * [Get corporation shareholders](#get-corporation-shareholders)
    * [Get corporation standings](#get-corporation-standings)
    * [Get corporation starbases (POSes)](#get-corporation-starbases-poses)
    * [Get starbase (POS) detail](#get-starbase-pos-detail)
    * [Get corporation structures](#get-corporation-structures)
    * [Get corporation titles](#get-corporation-titles)
    * [Get npc corporations](#get-npc-corporations)
  * [Dogma](#dogma)
    * [Get attributes](#get-attributes)
    * [Get attribute information](#get-attribute-information)
    * [Get dynamic item information](#get-dynamic-item-information)
    * [Get effects](#get-effects)
    * [Get effect information](#get-effect-information)
  * [Faction Warfare](#faction-warfare)
    * [Overview of a character involved in faction warfare](#overview-of-a-character-involved-in-faction-warfare)
    * [Overview of a corporation involved in faction warfare](#overview-of-a-corporation-involved-in-faction-warfare)
    * [List of the top factions in faction warfare](#list-of-the-top-factions-in-faction-warfare)
    * [List of the top pilots in faction warfare](#list-of-the-top-pilots-in-faction-warfare)
    * [List of the top corporations in faction warfare](#list-of-the-top-corporations-in-faction-warfare)
    * [An overview of statistics about factions involved in faction warfare](#an-overview-of-statistics-about-factions-involved-in-faction-warfare)
    * [Ownership of faction warfare systems](#ownership-of-faction-warfare-systems)
    * [Data about which NPC factions are at war](#data-about-which-npc-factions-are-at-war)
  * [Fittings](#fittings)
    * [Get fitting](#get-fitting)
    * [Create fitting](#create-fitting)
    * [Delete fitting](#delete-fitting)
  * [Fleets](#fleets)
    * [Get character fleet info](#get-character-fleet-info)
    * [Get fleet information](#get-fleet-information)
    * [Update fleet](#update-fleet)
    * [Get fleet members](#get-fleet-members)
    * [Create fleet invitation](#create-fleet-invitation)
    * [Kick fleet member](#kick-fleet-member)
    * [Move fleet member](#move-fleet-member)
    * [Delete fleet squad](#delete-fleet-squad)
    * [Rename fleet squad](#rename-fleet-squad)
    * [Get fleet wings](#get-fleet-wings)
    * [Create fleet wing](#create-fleet-wing)
    * [Delete fleet wing](#delete-fleet-wing)
    * [Rename fleet wing](#rename-fleet-wing)
    * [Create fleet squad](#create-fleet-squad)
  * [Incursions](#incursions)
    * [List incursions](#list-incursions)
  * [Industry](#industry)
    * [List character industry jobs](#list-character-industry-jobs)
    * [Character mining ledger](#character-mining-ledger)
    * [Moon extraction timers](#moon-extraction-timers)
    * [Corporation mining observers](#corporation-mining-observers)
    * [Observed corporation mining](#observed-corporation-mining)
    * [List corporation industry jobs](#list-corporation-industry-jobs)
    * [List industry facilities](#list-industry-facilities)
    * [List solar system cost indices](#list-solar-system-cost-indices)
  * [Insurance](#insurance)
    * [List insurance levels](#list-insurance-levels)
  * [Killmails](#killmails)
    * [Get a character's recent kills and losses](#get-a-characters-recent-kills-and-losses)
    * [Get a corporation's recent kills and losses](#get-a-corporations-recent-kills-and-losses)
    * [Get a single killmail](#get-a-single-killmail)
  * [Location](#location)
    * [Get character location](#get-character-location)
    * [Get character online](#get-character-online)
    * [Get current ship](#get-current-ship)
  * [Loyalty](#loyalty)
    * [Get loyalty points](#get-loyalty-points)
    * [List loyalty store offers](#list-loyalty-store-offers)
  * [Mail](#mail)
    * [Return mail headers](#return-mail-headers)
    * [Send a new mail](#send-a-new-mail)
    * [Delete a mail](#delete-a-mail)
    * [Return a mail](#return-a-mail)
    * [Update metadata about a mail](#update-metadata-about-a-mail)
    * [Get mail labels and unread counts](#get-mail-labels-and-unread-counts)
    * [Create a mail label](#create-a-mail-label)
    * [Delete a mail label](#delete-a-mail-label)
    * [Return mailing list subscriptions](#return-mailing-list-subscriptions)
  * [Market](#market)
    * [List open orders from a character](#list-open-orders-from-a-character)
    * [List historical orders by a character](#list-historical-orders-by-a-character)
    * [List open orders from a corporation](#list-open-orders-from-a-corporation)
    * [List historical orders from a corporation](#list-historical-orders-from-a-corporation)
    * [List historical market statistics in a region](#list-historical-market-statistics-in-a-region)
    * [List orders in a region](#list-orders-in-a-region)
    * [List type IDs relevant to a market](#list-type-ids-relevant-to-a-market)
    * [Get item groups](#get-item-groups)
    * [Get item group information](#get-item-group-information)
    * [List market prices](#list-market-prices)
    * [List orders in a structure](#list-orders-in-a-structure)
  * [Opportunities](#opportunities)
    * [Get a character's completed task](#get-a-characters-completed-task)
    * [Get opportunities groups](#get-opportunities-groups)
    * [Get opportunities group](#get-opportunities-group)
    * [Get opportunities tasks](#get-opportunities-tasks)
    * [Get opportunities task](#get-opportunities-task)
  * [Planetary Interaction](#planetary-interaction)
    * [Get colonies](#get-colonies)
    * [Get colony layout](#get-colony-layout)
    * [List corporation customs offices](#list-corporation-customs-offices)
    * [Get schematic information](#get-schematic-information)
  * [Routes](#routes)
    * [Get route](#get-route)
  * [Search](#search)
    * [Search on a string (search for something in character stuff)](#search-on-a-string-search-for-something-in-character-stuff)
    * [Search on a string](#search-on-a-string)
  * [Skills](#skills)
    * [Get character attributes](#get-character-attributes)
    * [Get character's skill queue](#get-characters-skill-queue)
    * [Get character skills](#get-character-skills)
  * [Sovereignty](#sovereignty)
    * [List sovereignty campaigns](#list-sovereignty-campaigns)
    * [List sovereignty of systems](#list-sovereignty-of-systems)
    * [List sovereignty structures](#list-sovereignty-structures)
  * [Status](#status)
    * [Retrieve the uptime and player counts](#retrieve-the-uptime-and-player-counts)
  * [Universe](#universe)
    * [Get ancestries](#get-ancestries)
    * [Get asteroid belt information](#get-asteroid-belt-information)
    * [Get bloodlines](#get-bloodlines)
    * [Get item categories](#get-item-categories)
    * [Get item category information](#get-item-category-information)
    * [Get constellations](#get-constellations)
    * [Get constellation information](#get-constellation-information)
    * [Get factions](#get-factions)
    * [Get graphics](#get-graphics)
    * [Get graphic information](#get-graphic-information)
    * [Get item groups](#get-item-groups)
    * [Get item group information](#get-item-group-information)
    * [Bulk names to IDs](#bulk-names-to-ids)
    * [Get moon information](#get-moon-information)
    * [Get names and categories for a set of ID's](#get-names-and-categories-for-a-set-of-ids)
    * [Get planet information](#get-planet-information)
    * [Get character races](#get-character-races)
    * [Get regions](#get-regions)
    * [Get region information](#get-region-information)
    * [Get stargate information](#get-stargate-information)
    * [Get star information](#get-star-information)
    * [Get station information](#get-station-information)
    * [List all public structures](#list-all-public-structures)
    * [Get structure information](#get-structure-information)
    * [Get system jumps](#get-system-jumps)
    * [Get system kills](#get-system-kills)
    * [Get solar systems](#get-solar-systems)
    * [Get solar system information](#get-solar-system-information)
    * [Get types](#get-types)
    * [Get type information](#get-type-information)
  * [User Interface](#user-interface)
    * [Set Autopilot Waypoint](#set-autopilot-waypoint)
    * [Open Contract Window](#open-contract-window)
    * [Open Information Window](#open-information-window)
    * [Open Market Details](#open-market-details)
    * [Open New Mail Window](#open-new-mail-window)
  * [Wallet](#wallet)
    * [Get a character's wallet balance](#get-a-characters-wallet-balance)
    * [Get character wallet journal](#get-character-wallet-journal)
    * [Get wallet transactions](#get-wallet-transactions)
    * [Returns a corporation's wallet balance](#returns-a-corporations-wallet-balance)
    * [Get corporation wallet journal](#get-corporation-wallet-journal)
    * [Get corporation wallet transactions](#get-corporation-wallet-transactions)
  * [Wars](#wars)
    * [List wars](#list-wars)
    * [Get war information](#get-war-information)
    * [List kills for a war](#list-kills-for-a-war)
* [Exceptions](#exceptions)
* [Timeouts](#timeouts)
* [Languages support](#languages-support)
* [Oj as JSON Parser](#oj-as-json-parser)
* [Formulas](#formulas)
  * [Blueprint copy time](#blueprint-copy-time)
  * [Training rate](#training-rate)
* [Useful links](#useful-links)
* [Development](#development)
* [Contributing](#contributing)
* [Author](#author)
* [Contributors](#contributors)
* [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eve_online'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install eve_online
```

## Supported ruby versions

* Ruby 3.2
* Ruby 3.3
* Ruby 3.4

## Supported rails versions

* 7.1
* 7.2
* 8.0
* main

## Usage examples

### Alliance

#### List all alliances

```ruby
alliances = EveOnline::ESI::Alliances.new

alliances.scope # => nil

alliances.alliance_ids.size # => 3028

alliances.alliance_ids.first # => 1354830081
```

#### Get alliance information

```ruby
options = { alliance_id: 99_005_443 }

alliance = EveOnline::ESI::Alliance.new(options)

alliance.scope # => nil

alliance.as_json # => {:creator_corporation_id=>98306624,
                 #     :creator_id=>94195096,
                 #     :date_founded=>Sun, 03 May 2015 19:45:17 UTC +00:00,
                 #     :executor_corporation_id=>98306624,
                 #     :faction_id=>nil,
                 #     :name=>"Kids With Guns Alliance",
                 #     :ticker=>"-KWG-"}

alliance.creator_corporation_id # => 98306624
alliance.creator_id # => 94195096
alliance.date_founded # => Sun, 03 May 2015 19:45:17 UTC +00:00
alliance.executor_corporation_id # => 98306624
alliance.faction_id # => nil
alliance.name # => "Kids With Guns Alliance"
alliance.ticker # => "-KWG-"
```

#### List alliance's corporations

```ruby
options = { alliance_id: 99_005_443 }

alliance_corporations = EveOnline::ESI::AllianceCorporations.new(options)

alliance_corporations.scope # => nil

alliance_corporations.corporation_ids.size # => 70

alliance_corporations.corporation_ids.first # => 98091533
```

#### Get alliance icon

```ruby
options = { alliance_id: 99_005_443 }

alliance_icon = EveOnline::ESI::AllianceIcon.new(options)

alliance_icon.scope # => nil

alliance_icon.as_json # => {:icon_medium=>"https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=128",
                      #     :icon_small=>"https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=64"}

alliance_icon.icon_medium # => "https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=128"
alliance_icon.icon_small # => "https://images.evetech.net/alliances/99005443/logo?tenant=tranquility&size=64"
```

### Assets

#### Get character assets

```ruby
options = { token: 'token123', character_id: 90_729_314, page: 1 }

character_assets = EveOnline::ESI::CharacterAssets.new(options)

character_assets.scope # => "esi-assets.read_assets.v1"

character_assets.page # => 1

character_assets.total_pages # => 1

character_assets.assets.size # => 486

asset = character_assets.assets.first

asset.as_json # => {:is_blueprint_copy=>true,
              #     :is_singleton=>true,
              #     :item_id=>716338097,
              #     :location_flag=>"Hangar",
              #     :location_id=>1027847409779,
              #     :location_type=>"other",
              #     :quantity=>1
              #     :type_id=>1010}

asset.is_blueprint_copy # => true
asset.is_singleton # => true
asset.item_id # => 716338097
asset.location_flag # => "Hangar"
asset.location_id # => 1027847409779
asset.location_type # => "other"
asset.quantity # => 1
asset.type_id # => 1010
```

#### Get character asset locations

```ruby
options = { token: 'token123', character_id: 1_337_512_245, item_ids: [1_001_215_602_246] }

character_assets_locations = EveOnline::ESI::CharacterAssetsLocations.new(options)

character_assets_locations.scope # => "esi-assets.read_assets.v1"

character_assets_locations.assets_locations.size # => 1

asset_location = character_assets_locations.assets_locations.first

asset_location.as_json # => {:item_id=>1001215602246}

asset_location.item_id # => 1001215602246

asset_location.position.as_json # => {:x=>-928621543221.3319,
                                #     :y=>297645715142.40234,
                                #     :z=>-971212198300.4812}

asset_location.position.x # => -928621543221.3319
asset_location.position.y # => 297645715142.40234
asset_location.position.z # => -971212198300.4812
```

#### Get character asset names

```ruby
options = { token: 'token123', character_id: 1_337_512_245, item_ids: [1_001_215_602_246] }

character_assets_names = EveOnline::ESI::CharacterAssetsNames.new(options)

character_assets_names.scope # => "esi-assets.read_assets.v1"

character_assets_names.assets_names.size # => 1

asset_name = character_assets_names.assets_names.first

asset_name.as_json # => {:item_id=>1001215602246,
                   #     :name=>"HOLE"}

asset_name.item_id # => 1001215602246
asset_name.name # => "HOLE"
```

#### Get corporation assets

```ruby
options = { token: 'token123', corporation_id: 98_134_807, page: 1 }

corporation_assets = EveOnline::ESI::CorporationAssets.new(options)

corporation_assets.scope # => "esi-assets.read_corporation_assets.v1"

corporation_assets.roles # => ["Director"]

corporation_assets.page # => 1

corporation_assets.total_pages # => 1

corporation_assets.assets.size # => 486

asset = corporation_assets.assets.first

asset.as_json # => {:is_blueprint_copy=>true,
              #     :is_singleton=>true,
              #     :item_id=>716338097,
              #     :location_flag=>"Hangar",
              #     :location_id=>1027847409779,
              #     :location_type=>"other",
              #     :quantity=>1
              #     :type_id=>1010}

asset.is_blueprint_copy # => true
asset.is_singleton # => true
asset.item_id # => 716338097
asset.location_flag # => "Hangar"
asset.location_id # => 1027847409779
asset.location_type # => "other"
asset.quantity # => 1
asset.type_id # => 1010
```

#### Get corporation asset locations

```ruby
options = { token: 'token123', corporation_id: 98_134_807, item_ids: [1_001_215_602_246] }

corporation_assets_locations = EveOnline::ESI::CorporationAssetsLocations.new(options)

corporation_assets_locations.scope # => "esi-assets.read_corporation_assets.v1"

corporation_assets_locations.roles # => ["Director"]

corporation_assets_locations.assets_locations.size # => 1

asset_location = corporation_assets_locations.assets_locations.first

asset_location.as_json # => {:item_id=>1001215602246}

asset_location.item_id # => 1001215602246

asset_location.position.as_json # => {:x=>-928621543221.3319,
                                #     :y=>297645715142.40234,
                                #     :z=>-971212198300.4812}

asset_location.position.x # => -928621543221.3319
asset_location.position.y # => 297645715142.40234
asset_location.position.z # => -971212198300.4812
```

#### Get corporation asset names

```ruby
options = { token: 'token123', corporation_id: 98_134_807, item_ids: [1_001_215_602_246] }

corporation_assets_names = EveOnline::ESI::CorporationAssetsNames.new(options)

corporation_assets_names.scope # => "esi-assets.read_corporation_assets.v1"

corporation_assets_names.roles # => ["Director"]

corporation_assets_names.assets_names.size # => 1

asset_name = corporation_assets_names.assets_names.first

asset_name.as_json # => {:item_id=>1001215602246,
                   #     :name=>"HOLE"}

asset_name.item_id # => 1001215602246
asset_name.name # => "HOLE"
```

### Bookmarks

#### List bookmarks

#### List bookmark folders

#### List corporation bookmarks

#### List corporation bookmark folders

### Calendar

#### List calendar event summaries

```ruby
# Add `from_event` if you want skip records
options = { token: 'token123', character_id: 90_729_314 }

character_calendar = EveOnline::ESI::CharacterCalendar.new(options)

character_calendar.scope # => "esi-calendar.read_calendar_events.v1"

character_calendar.events.size # => 22

event = character_calendar.events.first

event.as_json # => {:event_date=>Tue, 06 Mar 2018 15:00:59 UTC +00:00,
              #     :event_id=>1635240,
              #     :event_response=>"not_responded",
              #     :importance=>0,
              #     :title=>"Moon extraction for 66-PMM - GoldMine-5-"}

event.event_date # => Tue, 06 Mar 2018 15:00:59 UTC +00:00
event.event_id # => 1635240
event.event_response # => "not_responded"
event.importance # => 0
event.title # => "Moon extraction for 66-PMM - GoldMine-5-"
```

#### Get an event

```ruby
options = { token: 'token123', character_id: 90_729_314, event_id: 1_635_240 }

calendar_event = EveOnline::ESI::CharacterCalendarEvent.new(options)

calendar_event.scope # => "esi-calendar.read_calendar_events.v1"

calendar_event.as_json # => {:date=>Tue, 06 Mar 2018 15:00:59 UTC +00:00,
                       #     :duration=>60,
                       #     :event_id=>1635240,
                       #     :importance=>0,
                       #     :owner_id=>90729314,
                       #     :owner_name=>"Green Black",
                       #     :owner_type=>"character",
                       #     :event_response=>"not_responded",
                       #     :text=>"",
                       #     :title=>"Moon extraction for 66-PMM - GoldMine-5-"}

calendar_event.date # => Tue, 06 Mar 2018 15:00:59 UTC +00:00
calendar_event.duration # => 60
calendar_event.event_id # => 1635240
calendar_event.importance # => 0
calendar_event.owner_id # => 90729314
calendar_event.owner_name # => "Green Black"
calendar_event.owner_type # => "character"
calendar_event.event_response # => "not_responded"
calendar_event.text # => ""
calendar_event.title # => "Moon extraction for 66-PMM - GoldMine-5-"
```

#### Respond to an event

#### Get attendees

### Character

#### Get character's public information

```ruby
options = { character_id: 90729314 }

character = EveOnline::ESI::Character.new(options)

character.scope # => nil

character.as_json # => {:alliance_id=>12345678,
                  #     :birthday=>Fri, 15 Jan 2010 15:26:00 UTC +00:00,
                  #     :bloodline_id=>4,
                  #     :corporation_id=>1000168,
                  #     :description=>"",
                  #     :faction_id=>500001,
                  #     :gender=>"male",
                  #     :name=>"Green Black",
                  #     :race_id=>2,
                  #     :security_status=>1.8694881661345457,
                  #     :title=>nil}

character.alliance_id # => 12345678
character.birthday # => Fri, 15 Jan 2010 15:26:00 UTC +00:00
character.bloodline_id # => 4
character.corporation_id # => 1000168
character.description  # => ""
character.faction_id # => 500001
character.gender # => "male"
character.name # => "Green Black"
character.race_id # => 2
character.security_status # => 1.8694881661345457
character.title # => nil
```

#### Get agents research

#### Get blueprints

```ruby
options = { token: 'token123', character_id: 90729314, page: 1 }

character_blueprints = EveOnline::ESI::CharacterBlueprints.new(options)

character_blueprints.scope # => "esi-characters.read_blueprints.v1"

character_blueprints.page # => 1

character_blueprints.total_pages # => 1

character_blueprints.blueprints.size # => 4

blueprint = character_blueprints.blueprints.first

blueprint.as_json # => {:item_id=>716338097,
                  #     :location_flag=>"Hangar",
                  #     :location_id=>61000032,
                  #     :material_efficiency=>10,
                  #     :quantity=>-2,
                  #     :runs=>300,
                  #     :time_efficiency=>0,
                  #     :type_id=>1010}

blueprint.item_id # => 716338097
blueprint.location_flag # => "Hangar"
blueprint.location_id # => 61000032
blueprint.material_efficiency # => 10
blueprint.quantity # => -2
blueprint.runs # => 300
blueprint.time_efficiency # => 0
blueprint.type_id # => 1010
```

#### Get corporation history

```ruby
options = { character_id: 90_729_314 }

character_corporation_history = EveOnline::ESI::CharacterCorporationHistory.new(options)

character_corporation_history.scope # => nil

character_corporation_history.entries.size # => 1

entry = character_corporation_history.entries.first

entry.as_json # => {:corporation_id=>1000168,
              #     :is_deleted=>nil,
              #     :record_id=>16785803,
              #     :start_date=>Tue, 10 May 2011 10:23:00 UTC +00:00}

entry.corporation_id # => 1000168
entry.is_deleted # => nil
entry.record_id # => 16785803
entry.start_date # => Tue, 10 May 2011 10:23:00 UTC +00:00
```

#### Calculate a CSPA charge cost

#### Get jump fatigue

```ruby
options = { token: 'token123', character_id: 90729314 }

character_fatigue = EveOnline::ESI::CharacterFatigue.new(options)

character_fatigue.scope # => "esi-characters.read_fatigue.v1"

character_fatigue.as_json # => {:jump_fatigue_expire_date=>nil,
                          #     :last_jump_date=>nil,
                          #     :last_update_date=>nil}

character_fatigue.jump_fatigue_expire_date # => nil
character_fatigue.last_jump_date # => nil
character_fatigue.last_update_date # => nil

# TODO: add real data here
```

#### Get medals

#### Get character notifications

```ruby
options = { token: 'token123', character_id: 90729314 }

character_notifications = EveOnline::ESI::CharacterNotifications.new(options)

character_notifications.scope # => "esi-characters.read_notifications.v1"

character_notifications.notifications.size # => 500

notification = character_notifications.notifications.first

notification.as_json # => {:is_read=>nil,
                     #     :notification_id=>774328832,
                     #     :sender_id=>1000125,
                     #     :sender_type=>"corporation",
                     #     :text=>"againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n"
                     #     :timestamp=>Thu, 01 Mar 2018 13:48:00 UTC +00:00,
                     #     :type=>"AllWarDeclaredMsg"}

notification.is_read # => nil
notification.notification_id # => 774328832
notification.sender_id # => 1000125
notification.sender_type # => "corporation"
notification.text # => "againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n"
notification.timestamp # => Thu, 01 Mar 2018 13:48:00 UTC +00:00
notification.type # => "AllWarDeclaredMsg"
```

#### Get new contact notifications

#### Get character portraits

```ruby
options = { character_id: 90_729_314 }

character_portrait = EveOnline::ESI::CharacterPortrait.new(options)

character_portrait.scope # => nil

character_portrait.as_json # => {:medium=>"https://images.evetech.net/Character/1337512245_128.jpg",
                           #     :large=>"https://images.evetech.net/Character/1337512245_256.jpg",
                           #     :huge=>"https://images.evetech.net/Character/1337512245_512.jpg",
                           #     :small=>"https://images.evetech.net/Character/1337512245_64.jpg"}

character_portrait.medium # => "https://images.evetech.net/Character/1337512245_128.jpg"
character_portrait.large # => "https://images.evetech.net/Character/1337512245_256.jpg"
character_portrait.huge # => "https://images.evetech.net/Character/1337512245_512.jpg"
character_portrait.small # => "https://images.evetech.net/Character/1337512245_64.jpg"
```

#### Get character corporation roles

#### Get standings

```ruby
options = { token: 'token123', character_id: 90729314 }

character_standing = EveOnline::ESI::CharacterStandings.new(options)

character_standing.scope # => "esi-characters.read_standings.v1"

character_standing.standings.size # => 37

standing = character_standing.standings.first

standing.as_json # => {:from_id=>500001,
                 #     :from_type=>"faction",
                 #     :standing=>0.3303719111639991}

standing.from_id # => 500001
standing.from_type # => "faction"
standing.standing # => 0.3303719111639991
```

#### Yearly aggregate stats

#### Get character corporation titles

#### Character affiliation

### Clones

#### Get clones

```ruby
options = { token: 'token123', character_id: 90729314 }

character_clones = EveOnline::ESI::CharacterClones.new(options)

character_clones.scope # => "esi-clones.read_clones.v1"

character_clones.home_location.as_json # => {:location_id=>61000032,
                                       #     :location_type=>"station"}

character_clones.jump_clones.size # => 2

jump_clone = character_clones.jump_clones.first

jump_clone.as_json # => {:jump_clone_id=>22357400,
                   #     :location_id=>61000032,
                   #     :location_type=>"station",
                   #     :name=>nil}

jump_clone.jump_clone_id # => 22357400
jump_clone.location_id # => 61000032
jump_clone.location_type # => "station"
jump_clone.name # => nil

jump_clone.implant_ids # => [22118]

character_clones.last_clone_jump_date # => Fri, 27 Jul 2012 14:50:11 UTC +00:00

character_clones.last_station_change_date # => Tue, 30 Jun 2015 21:51:13 UTC +00:00
```

#### Get active implants

```ruby
options = { token: 'token123', character_id: 90729314 }

character_implants = EveOnline::ESI::CharacterImplants.new(options)

character_implants.scope # => "esi-clones.read_implants.v1"

character_implants.implant_ids.size # => 5

character_implants.implant_ids # => [9899, 9941, 9942, 9943, 9956]
```

### Contacts

#### Get alliance contacts

#### Get alliance contact labels

#### Delete contacts

#### Get contacts

#### Add contacts

#### Edit contacts

#### Get contact labels

#### Get corporation contacts

#### Get corporation contact labels

### Contracts

#### Get contracts

```ruby
options = { token: 'token123', character_id: 1337512245, page: 1 }

contracts = EveOnline::ESI::CharacterContracts.new(options)

contracts.scope # => "esi-contracts.read_character_contracts.v1"

contracts.contracts.size # => 3

contract = contracts.contracts.first

contract.as_json # => {:acceptor_id=>2116199184,
                 #     :assignee_id=>2116199184,
                 #     :availability=>"personal",
                 #     :buyout=>nil,
                 #     :collateral=>0.0,
                 #     :contract_id=>154837125,
                 #     :date_accepted=>Fri, 06 Mar 2020 21:09:32 UTC +00:00,
                 #     :date_completed=>Fri, 06 Mar 2020 21:09:32 UTC +00:00,
                 #     :date_expired=>Sat, 07 Mar 2020 21:09:11 UTC +00:00,
                 #     :date_issued=>Fri, 06 Mar 2020 21:09:11 UTC +00:00,
                 #     :days_to_complete=>0,
                 #     :end_location_id=>60008674,
                 #     :for_corporation=>false,
                 #     :issuer_corporation_id=>98134807,
                 #     :issuer_id=>1337512245,
                 #     :price=>0.0,
                 #     :reward=>0.0,
                 #     :start_location_id=>60008674,
                 #     :status=>"finished",
                 #     :title=>"",
                 #     :type=>"item_exchange",
                 #     :volume=>15000.0}

contract.acceptor_id # => 2116199184
contract.assignee_id # => 2116199184
contract.availability # => "personal"
contract.buyout # => nil
contract.collateral # => 0.0
contract.contract_id # => 154837125
contract.date_accepted # => Fri, 06 Mar 2020 21:09:32 UTC +00:00
contract.date_completed # => Fri, 06 Mar 2020 21:09:32 UTC +00:00
contract.date_expired # => Sat, 07 Mar 2020 21:09:11 UTC +00:00
contract.date_issued # => Fri, 06 Mar 2020 21:09:11 UTC +00:00
contract.days_to_complete # => 0
contract.end_location_id # => 60008674
contract.for_corporation # => false
contract.issuer_corporation_id # => 98134807
contract.issuer_id # => 1337512245
contract.price # => 0.0
contract.reward # => 0.0
contract.start_location_id # => 60008674
contract.status # => "finished"
contract.title # => ""
contract.type # => "item_exchange"
contract.volume # => 15000.0
```

#### Get contract bids

#### Get contract items

#### Get public contracts

```ruby
options = { region_id: 10_000_043, page: 1 }

contracts = EveOnline::ESI::PublicContracts.new(options)

contracts.scope # => nil

contracts.page # => 1

contracts.total_pages # => 4

contracts.contracts.size # => 1000

contract = contracts.contracts.first

contract.as_json # => {:buyout=>nil,
                 #     :collateral=>0.0,
                 #     :contract_id=>157834735,
                 #     :date_expired=>Wed, 17 Jun 2020 21:36:41 UTC +00:00,
                 #     :date_issued=>Wed, 20 May 2020 21:36:41 UTC +00:00,
                 #     :days_to_complete=>0,
                 #     :end_location_id=>60008494,
                 #     :for_corporation=>true,
                 #     :issuer_corporation_id=>897372069,
                 #     :issuer_id=>1314102096,
                 #     :price=>1250000000.0,
                 #     :reward=>0.0,
                 #     :start_location_id=>60008494,
                 #     :title=>"Apostle Me10/Te16 Complete Bpc 10 Pack",
                 #     :kind=>"item_exchange",
                 #     :volume=>100.0}

contract.buyout # => nil
contract.collateral # => 0.0
contract.contract_id # => 157834735
contract.date_expired # => Wed, 17 Jun 2020 21:36:41 UTC +00:00
contract.date_issued # => Wed, 20 May 2020 21:36:41 UTC +00:00
contract.days_to_complete # => 0
contract.end_location_id # => 60008494
contract.for_corporation # => true
contract.issuer_corporation_id # => 897372069
contract.issuer_id # => 1314102096
contract.price # => 1250000000.0
contract.reward # => 0.0
contract.start_location_id # => 60008494
contract.title # => "Apostle Me10/Te16 Complete Bpc 10 Pack"
contract.kind # => "item_exchange"
contract.volume # => 100.0
```

#### Get public contract bids

```ruby
options = { contract_id: 157_872_948, page: 1 }

contract = EveOnline::ESI::PublicContract.new(options)

contract.scope # => nil

contract.page # => 1

contract.total_pages # => 1

contract.items.size # => 1

item = contract.items.first

item.as_json # => {:is_blueprint_copy=>true,
             #     :is_included=>true,
             #     :item_id=>1029552558074,
             #     :material_efficiency=>10,
             #     :quantity=>1,
             #     :record_id=>3210378611,
             #     :runs=>400,
             #     :time_efficiency=>20,
             #     :type_id=>29040}

item.is_blueprint_copy # => true
item.is_included # => true
item.item_id # => 1029552558074
item.material_efficiency # => 10
item.quantity # => 1
item.record_id # => 3210378611
item.runs # => 400
item.time_efficiency # => 20
item.type_id # => 29040
```

#### Get public contract items

#### Get corporation contracts

#### Get corporation contract bids

#### Get corporation contract items

### Corporation

#### Get corporation information

```ruby
options = { corporation_id: 98_468_592 }

corporation = EveOnline::ESI::Corporation.new(options)

corporation.scope # => nil

corporation.as_json # => {:alliance_id=>99007916,
                    #     :ceo_id=>1721864142,
                    #     :creator_id=>1721864142,
                    #     :date_founded=>Mon, 11 Jul 2016 14:22:17 UTC +00:00,
                    #     :description=>"",
                    #     :faction_id=>nil,
                    #     :home_station_id=>60011893,
                    #     :member_count=>60,
                    #     :name=>"Bullshit Bingo Club",
                    #     :shares=>1000,
                    #     :tax_rate=>0.1,
                    #     :ticker=>"BUBIC",
                    #     :corporation_url=>"http://",
                    #     :war_eligible=>true}

corporation.alliance_id # => 99007916
corporation.ceo_id # => 1721864142
corporation.creator_id # => 1721864142
corporation.date_founded # => Mon, 11 Jul 2016 14:22:17 UTC +00:00
corporation.description # => ""
corporation.faction_id # => nil
corporation.home_station_id # => 60011893
corporation.member_count # => 60
corporation.name # => "Bullshit Bingo Club"
corporation.shares # => 1000
corporation.tax_rate # => 0.1
corporation.ticker # => "BUBIC"
corporation.corporation_url # => "http://"
corporation.war_eligible # => true
```

#### Get alliance history

```ruby
options = { corporation_id: 98_134_807 }

corporation_alliance_history = EveOnline::ESI::CorporationAllianceHistory.new(options)

corporation_alliance_history.scope # => nil

corporation_alliance_history.roles # => []

corporation_alliance_history.entries.size # => 12

entry = corporation_alliance_history.entries.first

entry.as_json # => {:alliance_id=>99005874,
              #     :is_deleted=>nil,
              #     :record_id=>1254640,
              #     :start_date=>Mon, 03 Jun 2019 00:17:00 UTC +00:00}

entry.alliance_id # => 99005874
entry.is_deleted # => nil
entry.record_id # => 1254640
entry.start_date # => Mon, 03 Jun 2019 00:17:00 UTC +00:00
```

#### Get corporation blueprints

```ruby
options = { token: 'token123', corporation_id: 98260237, page: 1 }

corporation_blueprints = EveOnline::ESI::CorporationBlueprints.new(options)

corporation_blueprints.scope # => "esi-corporations.read_blueprints.v1"

corporation_blueprints.page # => 1

corporation_blueprints.total_pages # => 1

corporation_blueprints.blueprints.size # => 387

blueprint = corporation_blueprints.blueprints.first

blueprint.as_json # => {:item_id => 1007566533085,
                  #     :location_flag => "CorpSAG2",
                  #     :location_id => 1024637025781,
                  #     :material_efficiency => 10,
                  #     :quantity => -2,
                  #     :runs => 300,
                  #     :time_efficiency => 20,
                  #     :type_id => 31803}

blueprint.item_id # => 1007566533085
blueprint.location_flag # => "CorpSAG2"
blueprint.location_id # => 1024637025781
blueprint.material_efficiency # => 10
blueprint.quantity # => -2
blueprint.runs # => 300
blueprint.time_efficiency # => 20
blueprint.type_id # => 31803

corporation_blueprints.roles # => ["Director"]
```

#### Get all corporation ALSC logs

#### Get corporation divisions

#### Get corporation facilities

#### Get corporation icon

#### Get corporation medals

#### Get corporation issued medals

#### Get corporation members

```ruby
options = { token: 'token123', corporation_id: 98565696 }

corporation_members = EveOnline::ESI::CorporationMembers.new(options)

corporation_members.scope # => "esi-corporations.read_corporation_membership.v1"

corporation_members.character_ids.size # => 118

corporation_members.character_ids.first # => 2114220544
```

#### Get corporation member limit

#### Get corporation's members' titles

#### Track corporation members

#### Get corporation member roles

#### Get corporation member roles history

#### Get corporation shareholders

#### Get corporation standings

#### Get corporation starbases (POSes)

#### Get starbase (POS) detail

#### Get corporation structures

#### Get corporation titles

#### Get npc corporations

```ruby
corporation_npcs = EveOnline::ESI::CorporationNPC.new

corporation_npcs.scope # => nil

corporation_npcs.corporation_npc_ids.size # => 262

corporation_npcs.corporation_npc_ids.first # => 1000001
```

### Dogma

#### Get attributes

```ruby
dogma_attributes = EveOnline::ESI::DogmaAttributes.new

dogma_attributes.scope # => nil

dogma_attributes.attribute_ids.size # => 2469

dogma_attributes.attribute_ids.first # => 2
```

#### Get attribute information

```ruby
options = { id: 2 }

dogma_attribute = EveOnline::ESI::DogmaAttribute.new(options)

dogma_attribute.scope # => nil

dogma_attribute.as_json # => {:attribute_id=>2,
                        #     :default_value=>0.0,
                        #     :description=>"Boolean to store status of online effect",
                        #     :display_name=>"",
                        #     :high_is_good=>true,
                        #     :icon_id=>nil,
                        #     :name=>"isOnline",
                        #     :published=>nil,
                        #     :stackable=>true,
                        #     :unit_id=>nil}

dogma_attribute.attribute_id # => 2
dogma_attribute.default_value # => 0.0
dogma_attribute.description # => "Boolean to store status of online effect"
dogma_attribute.display_name # => ""
dogma_attribute.high_is_good # => true
dogma_attribute.icon_id # => nil
dogma_attribute.name # => "isOnline"
dogma_attribute.published # => nil
dogma_attribute.stackable # => true
dogma_attribute.unit_id # => nil
```

#### Get dynamic item information

#### Get effects

```ruby
dogma_effects = EveOnline::ESI::DogmaEffects.new

dogma_effects.scope # => nil

dogma_effects.effect_ids.size # => 4166

dogma_effects.effect_ids.first # => 4
```

#### Get effect information

```ruby
options = { id: 6717 }

dogma_effect = EveOnline::ESI::DogmaEffect.new(options)

dogma_effect.scope # => nil

dogma_effect.as_json # => {:description=>"Automatically generated effect",
                     #     :disallow_auto_repeat=>nil,
                     #     :discharge_attribute_id=>nil,
                     #     :display_name=>"",
                     #     :duration_attribute_id=>nil,
                     #     :effect_category=>0,
                     #     :effect_id=>6717,
                     #     :electronic_chance=>nil,
                     #     :falloff_attribute_id=>nil,
                     #     :icon_id=>nil,
                     #     :is_assistance=>nil,
                     #     :is_offensive=>nil,
                     #     :is_warp_safe=>nil,
                     #     :name=>"roleBonusIceOreMiningDurationCap",
                     #     :post_expression=>19291,
                     #     :pre_expression=>19290,
                     #     :published=>nil,
                     #     :range_attribute_id=>nil,
                     #     :range_chance=>nil,
                     #     :tracking_speed_attribute_id=>nil}

dogma_effect.description # => "Automatically generated effect"
dogma_effect.disallow_auto_repeat # => nil
dogma_effect.discharge_attribute_id # => nil
dogma_effect.display_name # => ""
dogma_effect.duration_attribute_id # => nil
dogma_effect.effect_category # => 0
dogma_effect.effect_id # => 6717
dogma_effect.electronic_chance # => nil
dogma_effect.falloff_attribute_id # => nil
dogma_effect.icon_id # => nil
dogma_effect.is_assistance # => nil
dogma_effect.is_offensive # => nil
dogma_effect.is_warp_safe # => nil
dogma_effect.name # => "roleBonusIceOreMiningDurationCap"
dogma_effect.post_expression # => 19291
dogma_effect.pre_expression # => 19290
dogma_effect.published # => nil
dogma_effect.range_attribute_id # => nil
dogma_effect.range_chance # => nil
dogma_effect.tracking_speed_attribute_id # => nil

dogma_effect.modifiers.size # => 4

modifier = dogma_effect.modifiers.first

modifier.as_json # => {:domain=>"shipID",
                 #     :effect_id=>nil,
                 #     :func=>"LocationRequiredSkillModifier",
                 #     :modified_attribute_id=>73,
                 #     :modifying_attribute_id=>2458,
                 #     :operator=>6}

modifier.domain # => "shipID"
modifier.effect_id # => nil
modifier.func # => "LocationRequiredSkillModifier"
modifier.modified_attribute_id # => 73
modifier.modifying_attribute_id # => 2458
modifier.operator # => 6
```

### Faction Warfare

#### Overview of a character involved in faction warfare

#### Overview of a corporation involved in faction warfare

#### List of the top factions in faction warfare

#### List of the top pilots in faction warfare

#### List of the top corporations in faction warfare

#### An overview of statistics about factions involved in faction warfare

#### Ownership of faction warfare systems

#### Data about which NPC factions are at war

### Fittings

#### Get fitting

#### Create fitting

#### Delete fitting

### Fleets

#### Get character fleet info

#### Get fleet information

#### Update fleet

#### Get fleet members

#### Create fleet invitation

#### Kick fleet member

#### Move fleet member

#### Delete fleet squad

#### Rename fleet squad

#### Get fleet wings

#### Create fleet wing

#### Delete fleet wing

#### Rename fleet wing

#### Create fleet squad

### Incursions

#### List incursions

### Industry

#### List character industry jobs

```ruby
options = { token: 'token123', character_id: 90729314 }

character_jobs = EveOnline::ESI::CharacterIndustryJobs.new(options)

character_jobs.scope # => "esi-industry.read_character_jobs.v1"

character_jobs.jobs.size # => 3

job = character_jobs.jobs.first

job.as_json # => {:activity_id=>5,
            #     :blueprint_id=>1024839597103,
            #     :blueprint_location_id=>1023579231924,
            #     :blueprint_type_id=>28607,
            #     :completed_character_id=>nil,
            #     :completed_date=>nil,
            #     :cost=>902034.0,
            #     :duration=>625697,
            #     :end_date=>Sat, 25 Nov 2017 16:04:31 UTC +00:00,
            #     :facility_id=>1023579231924,
            #     :installer_id=>93997721,
            #     :job_id=>344732396,
            #     :licensed_runs=>1,
            #     :output_location_id=>1023579231924,
            #     :pause_date=>nil,
            #     :probability=>1.0,
            #     :product_type_id=>28607,
            #     :runs=>2,
            #     :start_date=>Sat, 18 Nov 2017 10:16:14 UTC +00:00,
            #     :station_id=>1023579231924,
            #     :status=>"active",
            #     :successful_runs=>nil}

job.activity_id # => 5
job.blueprint_id # => 1024839597103
job.blueprint_location_id # => 1023579231924
job.blueprint_type_id # => 28607
job.completed_character_id # => nil
job.completed_date # => nil
job.cost # => 902034.0
job.duration # => 625697
job.end_date # => Sat, 25 Nov 2017 16:04:31 UTC +00:00
job.facility_id # => 1023579231924
job.installer_id # => 93997721
job.job_id # => 344732396
job.licensed_runs # => 1
job.output_location_id # => 1023579231924
job.pause_date # => nil
job.probability # => 1.0
job.product_type_id # => 28607
job.runs # => 2
job.start_date # => Sat, 18 Nov 2017 10:16:14 UTC +00:00
job.station_id # => 1023579231924
job.status # => "active"
job.successful_runs # => nil
```

#### Character mining ledger

#### Moon extraction timers

#### Corporation mining observers

#### Observed corporation mining

#### List corporation industry jobs

```ruby
options = { token: 'token123', corporation_id: 98_146_630 }

corporation_jobs = EveOnline::ESI::CorporationIndustryJobs.new(options)

corporation_jobs.scope # => "esi-industry.read_corporation_jobs.v1"

corporation_jobs.page # => 1

corporation_jobs.total_pages # => 1

corporation_jobs.jobs.size # => 23

job = corporation_jobs.jobs.first

job.as_json # => {:activity_id=>1,
            #     :blueprint_id=>1026042055832,
            #     :blueprint_location_id=>1024956764558,
            #     :blueprint_type_id=>28607,
            #     :completed_character_id=>nil,
            #     :completed_date=>nil,
            #     :cost=>19505804.0,
            #     :duration=>424816,
            #     :end_date=>Thu, 23 Nov 2017 09:20:30 UTC +00:00,
            #     :facility_id=>1023579231924,
            #     :installer_id=>93174304,
            #     :job_id=>344736432,
            #     :licensed_runs=>1,
            #     :location_id=>60006382,
            #     :output_location_id=>1024956764558,
            #     :pause_date=>nil,
            #     :probability=>1.0,
            #     :product_type_id=>28606,
            #     :runs=>1,
            #     :start_date=>Sat, 18 Nov 2017 11:20:14 UTC +00:00,
            #     :status=>"active",
            #     :successful_runs=>nil}

job.activity_id # => 1
job.blueprint_id # => 1026042055832
job.blueprint_location_id # => 1024956764558
job.blueprint_type_id # => 28607
job.completed_character_id # => nil
job.completed_date # => nil
job.cost # => 19505804.0
job.duration # => 424816
job.end_date # => Thu, 23 Nov 2017 09:20:30 UTC +00:00
job.facility_id # => 1023579231924
job.installer_id # => 93174304
job.job_id # => 344736432
job.licensed_runs # => 1
job.location_id # => 60006382
job.output_location_id # => 1024956764558
job.pause_date # => nil
job.probability # => 1.0
job.product_type_id # => 28606
job.runs # => 1
job.start_date # => Sat, 18 Nov 2017 11:20:14 UTC +00:00
job.status # => "active"
job.successful_runs # => nil

corporation_jobs.roles # => ["Factory_Manager"]
```

#### List industry facilities

#### List solar system cost indices

### Insurance

#### List insurance levels

### Killmails

#### Get a character's recent kills and losses

```ruby
options = { token: 'token123', character_id: 90_729_314 }

character_killmails = EveOnline::ESI::CharacterKillmailsRecent.new(options)

character_killmails.scope # => "esi-killmails.read_killmails.v1"

character_killmails.page # => 1

character_killmails.total_pages # => 1

character_killmails.killmails.size # => 1

killmail = character_killmails.killmails.first

killmail.as_json # => {:killmail_hash=>"8f1450fca8ce97be9b10e106a1257088407ef387",
                 #     :killmail_id=>81_646_519}

killmail.killmail_hash # => "8f1450fca8ce97be9b10e106a1257088407ef387"
killmail.killmail_id # => 81646519
```

#### Get a corporation's recent kills and losses

```ruby
options = { token: 'token123', corporation_id: 98_146_630 }

corporation_killmails = EveOnline::ESI::CorporationKillmailsRecent.new(options)

corporation_killmails.scope # => "esi-killmails.read_corporation_killmails.v1"

corporation_killmails.page # => 1

corporation_killmails.total_pages # => 1

corporation_killmails.killmails.size # => 1

killmail = corporation_killmails.killmails.first

killmail.as_json # => {:killmail_hash=>"07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5",
                 #     :killmail_id=>72410059}

killmail.killmail_hash # => "07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5"
killmail.killmail_id # => 72410059

corporation_killmails.roles # => ["Director"]
```

#### Get a single killmail

```ruby
options = { killmail_id: 81_646_519, killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387" }

killmail = EveOnline::ESI::Killmail.new(options)

# TODO: finish this
```

### Location

#### Get character location

```ruby
options = { token: 'token123', character_id: 90729314 }

character_location = EveOnline::ESI::CharacterLocation.new(options)

character_location.scope # => "esi-location.read_location.v1"

character_location.as_json # => {:solar_system_id=>30004971,
                           #     :station_id=>60014689,
                           #     :structure_id=>nil}

character_location.solar_system_id # => 30004971
character_location.station_id # => 60014689
character_location.structure_id # => nil
```

#### Get character online

```ruby
options = { token: 'token123', character_id: 90729314 }

character_online = EveOnline::ESI::CharacterOnline.new(options)

character_online.scope # => "esi-location.read_online.v1"

character_online.as_json # => {:last_login=>Sun, 15 Jan 2017 11:39:24 UTC +00:00,
                         #     :last_logout=>Sun, 15 Jan 2017 11:31:22 UTC +00:00,
                         #     :logins=>370,
                         #     :online=>false}

character_online.last_login # => Sun, 15 Jan 2017 11:39:24 UTC +00:00
character_online.last_logout # => Sun, 15 Jan 2017 11:31:22 UTC +00:00
character_online.logins # => 370
character_online.online # => false
```

#### Get current ship

```ruby
options = { token: 'token123', character_id: 90729314 }

character_ship = EveOnline::ESI::CharacterShip.new(options)

character_ship.scope # => "esi-location.read_ship_type.v1"

character_ship.as_json # => {:ship_item_id=>1002312158069,
                       #     :ship_name=>"Green Black's Velator",
                       #     :ship_type_id=>606}

character_ship.ship_item_id # => 1002312158069
character_ship.ship_name # => "Green Black's Velator"
character_ship.ship_type_id # => 606
```

### Loyalty

#### Get loyalty points

```ruby
options = { token: 'token123', character_id: 90729314 }

character_loyalty_points = EveOnline::ESI::CharacterLoyaltyPoints.new(options)

character_loyalty_points.scope # => "esi-characters.read_loyalty.v1"

character_loyalty_points.loyalty_points.size # => 5

loyalty_point = character_loyalty_points.loyalty_points.first

loyalty_point.as_json # => {:corporation_id=>1000035, :loyalty_points=>14163}

loyalty_point.corporation_id # => 1000035
loyalty_point.loyalty_points # => 14163
```

#### List loyalty store offers

```ruby
options = { corporation_id: 1_000_035 }

corporation_loyalty_store_offers = EveOnline::ESI::CorporationLoyaltyStoreOffers.new(options)

corporation_loyalty_store_offers.scope # => nil

corporation_loyalty_store_offers.roles # => []

corporation_loyalty_store_offers.offers.size # => 332

offer = corporation_loyalty_store_offers.offers.first

offer.as_json # => {:ak_cost=>nil,
              #     :isk_cost=>2400000,
              #     :lp_cost=>2400,
              #     :offer_id=>3584,
              #     :quantity=>5000,
              #     :type_id=>23047}

offer.ak_cost # => nil
offer.isk_cost # => 2400000
offer.lp_cost # => 2400
offer.offer_id # => 3584
offer.quantity # => 5000
offer.type_id # => 23047

offer.offer_required_items.size # => 1

offer_required_item = offer.offer_required_items.first

offer_required_item.quantity # => 5000
offer_required_item.type_id # => 234
```

### Mail

#### Return mail headers

```ruby
```

#### Send a new mail

```ruby
```

#### Delete a mail

```ruby
```

#### Return a mail

```ruby
options = { character_id: 1_337_512_245, mail_id: 376_045_681, token: "token" }

character_mail = EveOnline::ESI::CharacterGetMail.new(options)

character_mail.scope # => "esi-mail.read_mail.v1"

character_mail.as_json # => {:body=>"<font size=\"12\" color=\"#bfffffff\">moving</font>",
                       #     :from_id=>1208274826,
                       #     :read=>true,
                       #     :subject=>"moving",
                       #     :timestamp=>Mon, 10 Jun 2019 07:50:00 UTC +00:00}

character_mail.body # => "<font size=\"12\" color=\"#bfffffff\">moving</font>"
character_mail.from_id # => 1208274826
character_mail.read # => true
character_mail.subject # => "moving"
character_mail.timestamp # => Mon, 10 Jun 2019 07:50:00 UTC +00:00

character_mail.label_ids # => [4]

character_mail.recipients.size # => 1

recipient = character_mail.recipients.first

recipient.as_json # => {:recipient_id=>98134807,
                  #     :recipient_type=>"corporation"}

recipient.recipient_id # => 98134807
recipient.recipient_type # => "corporation"
```

#### Update metadata about a mail

```ruby
```

#### Get mail labels and unread counts

```ruby
options = { character_id: 1_337_512_245, token: "token" }

character_mail_labels = EveOnline::ESI::CharacterMailLabels.new(options)

character_mail_labels.scope # => "esi-mail.read_mail.v1"

character_mail_labels.total_unread_count # => 288

character_mail_labels.labels.size # => 4

label = character_mail_labels.labels.last

label.as_json # => {:color=>"#ffffff",
              #     :label_id=>8,
              #     :name=>"[Alliance]",
              #     :unread_count=>227}

label.color # => "#ffffff"
label.label_id # => 8
label.name # => "[Alliance]"
label.unread_count # => 227
```

#### Create a mail label

```ruby
```

#### Delete a mail label

```ruby
```

#### Return mailing list subscriptions

```ruby
```

### Market

#### List open orders from a character

```ruby
options = { token: 'token123', character_id: 90729314 }

character_orders = EveOnline::ESI::CharacterOrders.new(options)

character_orders.scope

character_orders.orders.size

order = character_orders.orders.first

order.as_json

order.duration
order.escrow
order.is_buy_order
order.is_corporation
order.issued
order.location_id
order.min_volume
order.order_id
order.price
order.range
order.region_id
order.type_id
order.volume_remain
order.volume_total

# TODO: update example
```

#### List historical orders by a character

#### List open orders from a corporation

```ruby
options = { token: 'token123', corporation_id: 1_000_168, page: 1 }

corporation_orders = EveOnline::ESI::CorporationOrders.new(options)

corporation_orders.scope

corporation_orders.page # => 1

corporation_orders.total_pages # => 1

corporation_orders.orders.size

order = corporation_orders.orders.first

order.as_json

order.duration
order.escrow
order.is_buy_order
order.issued
order.issued_by
order.location_id
order.min_volume
order.order_id
order.price
order.range
order.region_id
order.type_id
order.volume_remain
order.volume_total
order.wallet_division

# TODO: update example

# TODO: update

corporation_orders.roles # => ["Accountant", "Trader"]
```

#### List historical orders from a corporation

#### List historical market statistics in a region

```ruby
options = { region_id: 10000002, type_id: 28606 }

market_history = EveOnline::ESI::MarketHistory.new(options)

market_history.scope # => nil

statistics = market_history.history

statistics.size # => 412

stats_today = statistics.last

stats_today.as_json # => {:average=>602326589.84,
                    #     :date=>Wed, 16 Jan 2019 00:00:00 UTC +00:00,
                    #     :highest=>620169950.0,
                    #     :lowest=>579060022.71,
                    #     :order_count=>44,
                    #     :volume=>44}

stats_today.average # => 602326589.84
stats_today.date # => Wed, 16 Jan 2019 00:00:00 UTC +00:00
stats_today.highest # => 620169950.0
stats_today.lowest # => 579060022.71
stats_today.order_count # => 44
stats_today.volume # => 44
```

#### List orders in a region

#### List type IDs relevant to a market

#### Get item groups

```ruby
market_groups = EveOnline::ESI::MarketGroups.new

market_groups.scope # => nil

market_groups.market_group_ids.size # => 1872

market_groups.market_group_ids.first # => 2
```

#### Get item group information

```ruby
options = { id: 618, language: 'en-us' }

market_group = EveOnline::ESI::MarketGroup.new(options)

market_group.scope # => nil

market_group.as_json # => {:description=>"Implants intended for Subcervical Processing Slot 1.",
                     #     :market_group_id=>618,
                     #     :name=>"Implant Slot 01",
                     #     :parent_group_id=>532}

market_group.description # => "Implants intended for Subcervical Processing Slot 1."
market_group.market_group_id # => 618
market_group.name # => "Implant Slot 01"
market_group.parent_group_id # => 532

market_group.type_ids.size # => 48

market_group.type_ids.first # => 28802
```

#### List market prices

```ruby
market_prices = EveOnline::ESI::MarketPrices.new

market_prices.scope # => nil

market_prices.market_prices.size # => 12565

market_price = market_prices.market_prices.first


market_price.as_json # => {:adjusted_price=>923296.88,
                     #     :average_price=>1273871.6,
                     #     :type_id=>32772}

market_price.adjusted_price # => 923296.88
market_price.average_price # => 1273871.6
market_price.type_id # => 32772
```

#### List orders in a structure

### Opportunities

#### Get a character's completed task

#### Get opportunities groups

#### Get opportunities group

#### Get opportunities tasks

#### Get opportunities task

### Planetary Interaction

#### Get colonies

#### Get colony layout

#### List corporation customs offices

#### Get schematic information

### Routes

#### Get route

### Search

#### Search on a string (search for something in character stuff)

#### Search on a string

```ruby
# simple search

options = { search: "Jita" }

search = EveOnline::ESI::Search.new(options)

search.as_json # => {:agent_ids=>[3018357],
               #     :alliance_ids=>[99011026, 99005382, 99010662, 99010663, 99010665, 99010666],
               #     :character_ids=>[2118081143, ... 2114943117],
               #     :constellation_ids=>[],
               #     :corporation_ids=>[],
               #     :faction_ids=>[],
               #     :inventory_type_ids=>[56844, 56847, 56846, 56853, 56849, 56852, 56850, 52275, 56848, 56851, 56845],
               #     :region_ids=>[],
               #     :solar_system_ids=>[30000142],
               #     :station_ids=>[]}

search.agent_ids # => [3018357]
search.alliance_ids # => [99011026, 99005382, 99010662, 99010663, 99010665, 99010666]
search.character_ids.size # => 467
search.character_ids.first # => 2118081143
search.constellation_ids # => []
search.corporation_ids # => []
search.faction_ids  # => []
search.inventory_type_ids # => [56844, 56847, 56846, 56853, 56849, 56852, 56850, 52275, 56848, 56851, 56845]
search.region_ids # => []
search.solar_system_ids # => [30000142]
search.station_ids # => []

# strict search

options = { search: "Jita", strict: true }

search = EveOnline::ESI::Search.new(options)

search.as_json # => {:agent_ids=>[],
               #     :alliance_ids=>[99005382],
               #     :character_ids=>[1392050776],
               #     :constellation_ids=>[],
               #     :corporation_ids=>[98004200, 98049474, 383768304, 98358437],
               #     :faction_ids=>[],
               #     :inventory_type_ids=>[],
               #     :region_ids=>[],
               #     :solar_system_ids=>[30000142],
               #     :station_ids=>[]}

# strict search with filter by categories

# List of default categories (used when categories is empty):
# ["agent", "alliance", "character", "constellation", "corporation", "faction",
# "inventory_type", "region", "solar_system", "station"]

# So, add `categories: ['solar_system']` and see:

options = { search: "Jita", categories: ["solar_system"], strict: true }

search = EveOnline::ESI::Search.new(options)

search.as_json # => {:agent_ids=>[],
               #    :alliance_ids=>[],
               #    :character_ids=>[],
               #    :constellation_ids=>[],
               #    :corporation_ids=>[],
               #    :faction_ids=>[],
               #    :inventory_type_ids=>[],
               #    :region_ids=>[],
               #    :solar_system_ids=>[30000142],
               #    :station_ids=>[]}

search.solar_system_ids # => [30000142]
```

### Skills

#### Get character attributes

```ruby
options = { token: 'token123', character_id: 90729314 }

character_attributes = EveOnline::ESI::CharacterAttributes.new(options)

character_attributes.scope # => "esi-skills.read_skills.v1"

character_attributes.as_json # => {:accrued_remap_cooldown_date=>Sun, 06 May 2012 12:58:06 UTC +00:00,
                             #     :bonus_remaps=>2,
                             #     :charisma=>20,
                             #     :intelligence=>24,
                             #     :last_remap_date=>Sat, 07 May 2011 12:58:06 UTC +00:00,
                             #     :memory=>24,
                             #     :perception=>23,
                             #     :willpower=>23}

character_attributes.accrued_remap_cooldown_date # => Sun, 06 May 2012 12:58:06 UTC +00:00
character_attributes.bonus_remaps # => 2
character_attributes.charisma # => 20
character_attributes.intelligence # => 24
character_attributes.last_remap_date # => Sat, 07 May 2011 12:58:06 UTC +00:00
character_attributes.memory # => 24
character_attributes.perception # => 23
character_attributes.willpower # => 23
```

#### Get character's skill queue

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skill_queue = EveOnline::ESI::CharacterSkillQueue.new(options)

character_skill_queue.scope # => "esi-skills.read_skillqueue.v1"

character_skill_queue.skills.size # => 50

skill_queue_entry = character_skill_queue.skills.first

skill_queue_entry.as_json # => {:finish_date=>Mon, 16 Jan 2017 03:00:35 UTC +00:00,
                          #     :finished_level=>3,
                          #     :level_end_sp=>40000,
                          #     :level_start_sp=>7072
                          #     :queue_position=>0,
                          #     :skill_id=>12487,
                          #     :start_date=>Sun, 15 Jan 2017 11:38:25 UTC +00:00,
                          #     :training_start_sp=>7263}

skill_queue_entry.finish_date # => Mon, 16 Jan 2017 03:00:35 UTC +00:00
skill_queue_entry.finished_level # => 3
skill_queue_entry.level_end_sp # => 40000
skill_queue_entry.level_start_sp # => 7072
skill_queue_entry.queue_position # => 0
skill_queue_entry.skill_id # => 12487
skill_queue_entry.start_date # => Sun, 15 Jan 2017 11:38:25 UTC +00:00
skill_queue_entry.training_start_sp # => 7263
```

#### Get character skills

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skills = EveOnline::ESI::CharacterSkills.new(options)

character_skills.scope # => "esi-skills.read_skills.v1"

character_skills.as_json # => {:total_sp=>50362576, :unallocated_sp=>656000}

character_skills.skills.size # => 179

skill = character_skills.skills.first

skill.as_json # => {:active_skill_level=>0,
              #     :skill_id=>22536,
              #     :skillpoints_in_skill=>500,
              #     :trained_skill_level=>1}

skill.active_skill_level # => 0
skill.skill_id # => 22536
skill.skillpoints_in_skill # => 500
skill.trained_skill_level # => 1

character_skills.total_sp # => 50362576
character_skills.unallocated_sp # => 656000
```

### Sovereignty

#### List sovereignty campaigns

#### List sovereignty of systems

#### List sovereignty structures

### Status

#### Retrieve the uptime and player counts

```ruby
server_status = EveOnline::ESI::ServerStatus.new

server_status.scope # => nil

server_status.as_json # => {:players=>34545,
                      #     :server_version=>"1135520",
                      #     :start_time=>Tue, 11 Apr 2017 11:05:35 UTC +00:00,
                      #     :vip=>nil}

server_status.players # => 34545
server_status.server_version # => "1135520"
server_status.start_time # => Tue, 11 Apr 2017 11:05:35 UTC +00:00
server_status.vip # => nil
```

### Universe

#### Get ancestries

```ruby
options = { language: 'en-us' }

ancestries = EveOnline::ESI::UniverseAncestries.new(options)

ancestries.scope # => nil

ancestries.ancestries.size # => 42

ancestry = ancestries.ancestries.first

ancestry.as_json # => {:bloodline_id=>4,
                 #     :description=>"Millions of slaves within the Amarr Empire dream of escape...",
                 #     :icon_id=>1664,
                 #     :ancestry_id=>24,
                 #     :name=>"Slave Child",
                 #     :short_description=>"Torn from the cold and brought to the warmth of a new life."}

ancestry.bloodline_id # => 4
ancestry.description # => "Millions of slaves within the Amarr Empire dream of escape..."
ancestry.icon_id # => 1664
ancestry.ancestry_id # => 24
ancestry.name # => "Slave Child"
ancestry.short_description # => "Torn from the cold and brought to the warmth of a new life."
```

#### Get asteroid belt information

```ruby
options = { id: 40_000_003 }

asteroid_belt = EveOnline::ESI::UniverseAsteroidBelt.new(options)

asteroid_belt.scope # => nil

asteroid_belt.as_json # => {:name=>"Tanoo I - Asteroid Belt 1",
                      #     :system_id=>30000001}

asteroid_belt.name # => "Tanoo I - Asteroid Belt 1"
asteroid_belt.system_id # => 30000001

asteroid_belt.position.as_json # => {:x=>161967513600.0,
                               #     :y=>21288837120.0,
                               #     :z=>-73505464320.0}

asteroid_belt.position.x # => 161967513600.0
asteroid_belt.position.y # => 21288837120.0
asteroid_belt.position.z # => -73505464320.0
```

#### Get bloodlines

```ruby
options = { language: 'en-us' }

bloodlines = EveOnline::ESI::UniverseBloodlines.new(options)

bloodlines.scope # => nil

bloodlines.bloodlines.size # => 15

bloodline = bloodlines.bloodlines.first

bloodline.as_json # => {:bloodline_id=>4,
                  #     :charisma=>6,
                  #     :corporation_id=>1000049,
                  #     :description=>"A martial, strong-willed people, the Brutor...",
                  #     :intelligence=>4,
                  #     :memory=>4,
                  #     :name=>"Brutor",
                  #     :perception=>9,
                  #     :race_id=>2,
                  #     :ship_type_id=>588,
                  #     :willpower=>7}

bloodline.bloodline_id # => 4
bloodline.charisma # => 6
bloodline.corporation_id # => 1000049
bloodline.description # => "A martial, strong-willed people, the Brutor..."
bloodline.intelligence # => 4
bloodline.memory # => 4
bloodline.name # => "Brutor"
bloodline.perception # => 9
bloodline.race_id # => 2
bloodline.ship_type_id # => 588
bloodline.willpower # => 7
```

#### Get item categories

```ruby
categories = EveOnline::ESI::UniverseCategories.new

categories.scope # => nil

categories.category_ids.size # => 43

categories.category_ids.first # => 0
```

#### Get item category information

```ruby
options = { id: 6, language: 'en-us' }

category = EveOnline::ESI::UniverseCategory.new(options)

category.scope # => nil

category.as_json # => {:category_id=>6,
                 #     :name=>"Ship",
                 #     :published=>true}

category.category_id # => 6
category.name # => "Ship"
category.published # => true

category.group_ids.size # => 46
category.group_ids.first # => 25
```

#### Get constellations

```ruby
constellations = EveOnline::ESI::UniverseConstellations.new

constellations.scope # => nil

constellations.constellation_ids.size # => 1146

constellations.constellation_ids.first # => 20000001
```

#### Get constellation information

```ruby
options = { id: 20_000_001, language: 'en-us' }

constellation = EveOnline::ESI::UniverseConstellation.new(options)

constellation.scope # => nil

constellation.as_json # => {:constellation_id=>20000001,
                      #     :name=>"San Matar",
                      #     :region_id=>10000001}

constellation.constellation_id # => 20000001
constellation.name # => "San Matar"
constellation.region_id # => 10000001

constellation.system_ids # => [30000001, 30000002, 30000003, 30000004, 30000005, 30000006, 30000007, 30000008]

constellation.position.as_json # => {:x=>-9.404655970099134e+16,
                               #     :y=>4.952015315379885e+16,
                               #     :z=>-4.273873181840197e+16}

constellation.position.x # => -9.404655970099134e+16
constellation.position.y # => 4.952015315379885e+16
constellation.position.z # => -4.273873181840197e+16
```

#### Get factions

```ruby
options = { language: 'en-us' }

factions = EveOnline::ESI::UniverseFactions.new(options)

factions.scope # => nil

factions.factions.size # => 22

faction = factions.factions.first

faction.as_json # => {:corporation_id=>1000051,
                #     :description=>"The Minmatar Republic was formed over a century ago when the Minmatar threw...",
                #     :faction_id=>500002,
                #     :is_unique=>true,
                #     :militia_corporation_id=>1000182,
                #     :name=>"Minmatar Republic",
                #     :size_factor=>5.0,
                #     :solar_system_id=>30002544,
                #     :station_count=>570,
                #     :station_system_count=>291}

faction.corporation_id # => 1000051
faction.description # => "The Minmatar Republic was formed over a century ago when the Minmatar threw..."
faction.faction_id # => 500002
faction.is_unique # => true
faction.militia_corporation_id # => 1000182
faction.name # => "Minmatar Republic"
faction.size_factor # => 5.0
faction.solar_system_id # => 30002544
faction.station_count # => 570
faction.station_system_count # => 291
```

#### Get graphics

```ruby
graphics = EveOnline::ESI::UniverseGraphics.new

graphics.scope # => nil

graphics.graphic_ids.size # => 3702

graphics.graphic_ids.first # => 20480
```

#### Get graphic information

```ruby
options = { id: 20481 }

graphic = EveOnline::ESI::UniverseGraphic.new(options)

graphic.scope # => nil

graphic.as_json # => {:collision_file=>nil,
                #     :graphic_file=>nil,
                #     :graphic_id=>20481,
                #     :icon_folder=>nil,
                #     :sof_dna=>"ai1_t1:tash-murkon:amarr",
                #     :sof_fation_name=>"tash-murkon",
                #     :sof_hull_name=>"ai1_t1",
                #     :sof_race_name=>"amarr"}

graphic.collision_file # => nil
graphic.graphic_file # => nil
graphic.graphic_id # => 20481
graphic.icon_folder # => nil
graphic.sof_dna # => "ai1_t1:tash-murkon:amarr"
graphic.sof_fation_name # => "tash-murkon"
graphic.sof_hull_name # => "ai1_t1"
graphic.sof_race_name # => "amarr"
```

#### Get item groups

```ruby
options = { page: 1 }

groups = EveOnline::ESI::UniverseGroups.new(options)

groups.scope # => nil

groups.page  # => 1

groups.total_pages # => 2

groups.group_ids.size # => 1000

groups.group_ids.first # => 0
```

#### Get item group information

```ruby
options = { id: 450, language: 'en-us' }

group = EveOnline::ESI::UniverseGroup.new(options)

group.scope # => nil

group.as_json # => {:category_id=>25,
              #     :group_id=>450,
              #     :name=>"Arkonor",
              #     :published=>true}

group.category_id # => 25
group.group_id # => 450
group.name # => "Arkonor"
group.published # => true
group.type_ids # => [22, 17425, 17426, 26852, 28367, 28385, 28387, 28625, 46678, 46691]
```

#### Bulk names to IDs

#### Get moon information

```ruby
options = { id: 40000004 }

moon = EveOnline::ESI::UniverseMoon.new(options)

moon.scope # => nil

moon.as_json # => {:moon_id=>40000004,
             #     :name=>"Tanoo I - Moon 1",
             #     :system_id=>30000001}

moon.moon_id # => 40000004
moon.name # => "Tanoo I - Moon 1"
moon.system_id # => 30000001

moon.position.as_json # => {:x=>162088094286.0,
                      #     :y=>21314854783.0,
                      #     :z=>-73598621491.0}

moon.position.x # => 162088094286.0
moon.position.y # => 21314854783.0
moon.position.z # => -73598621491.0
```

#### Get names and categories for a set of ID's

#### Get planet information

```ruby
options = { id: 40000002 }

planet = EveOnline::ESI::UniversePlanet.new(options)

planet.scope # => nil

planet.as_json # => {:name=>"Tanoo I",
               #     :planet_id=>40000002,
               #     :system_id=>30000001,
               #     :type_id=>11}

planet.name # => "Tanoo I"
planet.planet_id # => 40000002
planet.system_id # => 30000001
planet.type_id # => 11

planet.position.as_json # => {:x=>161891117336.0,
                        #     :y=>21288951986.0,
                        #     :z=>-73529712226.0}

planet.position.x # => 161891117336.0
planet.position.y # => 21288951986.0
planet.position.z # => -73529712226.0
```

#### Get character races

```ruby
options = { language: 'en-us' }

races = EveOnline::ESI::UniverseRaces.new(options)

races.scope # => nil

races.races.size # => 4

race = races.races.first

race.as_json # => {:faction_id=>500002,
             #     :description=>"Once a thriving tribal civilization, the Minmatar...",
             #     :name=>"Minmatar",
             #     :race_id=>2}

race.faction_id # => 500002
race.description # => "Once a thriving tribal civilization, the Minmatar..."
race.name # => "Minmatar"
race.race_id # => 2
```

#### Get regions

```ruby
regions = EveOnline::ESI::UniverseRegions.new

regions.scope # => nil

regions.universe_region_ids.size # => 106

regions.universe_region_ids.first # => 10000001
```

#### Get region information

```ruby
options = { id: 10_000_001, language: 'en-us' }

region = EveOnline::ESI::UniverseRegion.new(options)

region.scope # => nil

region.as_json # => {:description=>"The Derelik region...",
               #     :name=>"Derelik",
               #     :region_id=>10000001}

region.description # => "The Derelik region..."
region.name # => "Derelik"
region.region_id # => 10000001

region.constellation_ids.size # => 16
region.constellation_ids.first # => 20000001
```

#### Get stargate information

```ruby
options = { id: 50_000_056 }

stargate = EveOnline::ESI::UniverseStargate.new(options)

stargate.scope # => nil

stargate.as_json # => {:name=>"Stargate (Akpivem)",
                 #     :stargate_id=>50000056,
                 #     :system_id=>30000001,
                 #     :type_id=>29624,
                 #     :destination_stargate_id=>50000342,
                 #     :destination_system_id=>30000003}

stargate.name # => "Stargate (Akpivem)"
stargate.stargate_id # => 50000056
stargate.system_id # => 30000001
stargate.type_id # => 29624
stargate.destination_stargate_id # => 50000342
stargate.destination_system_id # => 30000003

stargate.position.as_json # => {:x=>331516354560.0,
                          #     :y=>43597455360.0,
                          #     :z=>-586353991680.0}

stargate.position.x # => 331516354560.0
stargate.position.y # => 43597455360.0
stargate.position.z # => -586353991680.0
```

#### Get star information

```ruby
options = { id: 40000001 }

star = EveOnline::ESI::UniverseStar.new(options)

star.scope # => nil

star.as_json # => {:age=>14262808228,
             #     :luminosity=>0.01575000025331974,
             #     :name=>"Tanoo - Star",
             #     :radius=>126700000,
             #     :solar_system_id=>30000001,
             #     :spectral_class=>"K2 V",
             #     :temperature=>4567,
             #     :type_id=>45041}

star.age # => 14262808228
star.luminosity # => 0.01575000025331974
star.name # => "Tanoo - Star"
star.radius # => 126700000
star.solar_system_id # => 30000001
star.spectral_class # => "K2 V"
star.temperature # => 4567
star.type_id # => 45041
```

#### Get station information

```ruby
options = { id: 60012526 }

station = EveOnline::ESI::UniverseStation.new(options)

station.scope # => nil

station.as_json # => {:max_dockable_ship_volume=>50000000.0,
                #     :name=>"Tanoo V - Moon 1 - Ammatar Consulate Bureau",
                #     :office_rental_cost=>329553.0,
                #     :owner=>1000126,
                #     :race_id=>2,
                #     :reprocessing_efficiency=>0.5,
                #     :reprocessing_stations_take=>0.05,
                #     :services=>
                #      ["bounty-missions",
                #       "courier-missions",
                #       "interbus",
                #       "reprocessing-plant",
                #       "market",
                #       "stock-exchange",
                #       "cloning",
                #       "repair-facilities",
                #       "fitting",
                #       "news",
                #       "insurance",
                #       "docking",
                #       "office-rental",
                #       "loyalty-point-store",
                #       "navy-offices",
                #       "security-offices"],
                #     :station_id=>60012526,
                #     :system_id=>30000001,
                #     :type_id=>2502}

station.max_dockable_ship_volume # => 50000000.0
station.name # => "Tanoo V - Moon 1 - Ammatar Consulate Bureau"
station.office_rental_cost # => 422500.0
station.owner # => 1000126
station.race_id # => 2
station.reprocessing_efficiency # => 0.5
station.reprocessing_stations_take # => 0.05
station.services # => ["bounty-missions",
                 #     "courier-missions",
                 #     "interbus",
                 #     "reprocessing-plant",
                 #     "market",
                 #     "stock-exchange",
                 #     "cloning",
                 #     "repair-facilities",
                 #     "fitting",
                 #     "news",
                 #     "insurance",
                 #     "docking",
                 #     "office-rental",
                 #     "loyalty-point-store",
                 #     "navy-offices",
                 #     "security-offices"]
station.station_id # => 60012526
station.system_id # => 30000001
station.type_id # => 2502

station.position.as_json # => {:x=>-1106145239040.0,
                         #     :y=>-145460060160.0,
                         #     :z=>182618726400.0}

station.position.x # => -1106145239040.0
station.position.y # => -145460060160.0
station.position.z # => 182618726400.0
```

#### List all public structures

```ruby
structures = EveOnline::ESI::UniverseStructures.new

structures.scope # => nil

structures.structure_ids.size # => 3654

structures.structure_ids.first # => 1027528548355

# with filter (`filter` is enum with values: nil, `market` and `manufacturing_basic`)

options = { filter: 'market' }

structures = EveOnline::ESI::UniverseStructures.new(options)

structures.structure_ids.size # => 108

structures.structure_ids.first # => 1030490622468
```

#### Get structure information

#### Get system jumps

```ruby
system_jumps = EveOnline::ESI::UniverseSystemJumps.new

system_jumps.scope # => nil

system_jumps.system_jumps.size # => 4979

jump = system_jumps.system_jumps.first

jump.as_json # => {:ship_jumps=>65, :system_id=>30002671}

jump.ship_jumps # => 65
jump.system_id # => 30002671
```

#### Get system kills

```ruby
system_kills = EveOnline::ESI::UniverseSystemKills.new

system_kills.scope # => nil

system_kills.system_kills.size # => 3194

system_kill = system_kills.system_kills.first

system_kill.as_json # => {:npc_kills=>89,
                    #     :pod_kills=>0,
                    #     :ship_kills=>5,
                    #     :system_id=>30005327}

system_kill.npc_kills # => 89
system_kill.pod_kills # => 0
system_kill.ship_kills # => 5
system_kill.system_id # => 30005327
```

#### Get solar systems

```ruby
systems = EveOnline::ESI::UniverseSystems.new

systems.scope # => nil

systems.universe_system_ids.size # => 8285

systems.universe_system_ids.first # => 30000001
```

#### Get solar system information

```ruby
options = { id: 30000001, language: 'en-us' }

system = EveOnline::ESI::UniverseSystem.new(options)

system.scope # => nil

system.as_json # => {:constellation_id=>20000001,
               #     :name=>"Tanoo",
               #     :security_class=>"B",
               #     :security_status=>0.8583240509033203,
               #     :star_id=>40000001,
               #     :system_id=>30000001}

system.constellation_id # => 20000001
system.name # => "Tanoo"
system.security_class # => "B"
system.security_status # => 0.8583240509033203
system.star_id # => 40000001
system.system_id # => 30000001

system.position.as_json # => {:x=>-8.851079259998058e+16,
                        #     :y=>4.236944396687888e+16,
                        #     :z=>-4.451352534647966e+16}

system.position.x # => -8.851079259998058e+16
system.position.y # => 4.236944396687888e+16
system.position.z # => -4.451352534647966e+16

system.planets.size # => 6

planet = system.planets.first

planet.as_json # => {:planet_id=>40000002}

planet.planet_id # => 40000002

planet.asteroid_belt_ids # => [40000003]

planet.moon_ids # => [40000004]

system.stargate_ids # => [50000056, 50000057, 50000058]

system.station_ids # => [60012526, 60014437]
```

#### Get types

```ruby
options = { page: 1 }

types = EveOnline::ESI::UniverseTypes.new(options)

types.scope # => nil

types.page # => 1

types.total_pages # => 36

types.universe_type_ids.size # => 1000

types.universe_type_ids.first # => 0
```

#### Get type information

```ruby
options = { id: 192, language: 'en-us' }

type = EveOnline::ESI::UniverseType.new(options)

type.scope # => nil

type.as_json # => {:capacity=>0.0,
             #     :description=>"Medium Projectile Ammo...",
             #     :graphic_id=>1297,
             #     :group_id=>83,
             #     :icon_id=>1297,
             #     :market_group_id=>112,
             #     :mass=>1.0,
             #     :name=>"Phased Plasma M",
             #     :packaged_volume=>0.0125,
             #     :portion_size=>100,
             #     :published=>true,
             #     :radius=>1.0,
             #     :type_id=>192,
             #     :volume=>0.0125}

type.capacity # => 0.0
type.description # => "Medium Projectile Ammo..."
type.graphic_id # => 1297
type.group_id # => 83
type.icon_id # => 1297
type.market_group_id # => 112
type.mass # => 1.0
type.name # => "Phased Plasma M"
type.packaged_volume # => 0.0125
type.portion_size # => 100
type.published # => true
type.radius # => 1.0
type.type_id # => 192
type.volume # => 0.0125

type.dogma_attributes.size # => 17

type_dogma_attribute = type.dogma_attributes.first

type_dogma_attribute.as_json # => {:attribute_id=>128,
                             #     :value=>2.0}

type_dogma_attribute.attribute_id # => 128
type_dogma_attribute.value # => 2.0

type.dogma_effects.size # => 3

type_dogma_effect = type.dogma_effects.first

type_dogma_effect.as_json # => {:effect_id=>596,
                          #     :is_default=>false}

type_dogma_effect.effect_id # => 596
type_dogma_effect.is_default # => false
```

### User Interface

#### Set Autopilot Waypoint

#### Open Contract Window

#### Open Information Window

#### Open Market Details

#### Open New Mail Window

### Wallet

#### Get a character's wallet balance

```ruby
options = { token: 'token123', character_id: 90_729_314 }

character_wallet = EveOnline::ESI::CharacterWallet.new(options)

character_wallet.scope # => "esi-wallet.read_character_wallet.v1"

character_wallet.as_json # => {:wallet=>409488252.49}

character_wallet.wallet # => 409488252.49
```

#### Get character wallet journal

```ruby
options = { token: 'token123', character_id: 90_729_314, page: 1 }

character_wallet_journal = EveOnline::ESI::CharacterWalletJournal.new(options)

character_wallet_journal.scope # => "esi-wallet.read_character_wallet.v1"

character_wallet_journal.page # => 1

character_wallet_journal.total_pages # => 1

character_wallet_journal.wallet_journal_entries.size # => 220

wallet_journal_entry = character_wallet_journal.wallet_journal_entries.first

wallet_journal_entry.as_json # => {:amount=>87375.0,
                             #     :balance=>2405126.01,
                             #     :context_id=>30003498,
                             #     :context_id_type=>"system_id",
                             #     :date=>Sun, 08 Mar 2020 12:08:25 UTC +00:00,
                             #     :description=>"Johnn Dillinger got bounty prizes for killing pirates in Sharhelund",
                             #     :first_party_id=>1000125,
                             #     :wallet_journal_id=>17740466914,
                             #     :reason=>"3744: 2,3748: 2,18085: 2,18070: 1",
                             #     :ref_type=>"bounty_prizes",
                             #     :second_party_id=>1337512245,
                             #     :tax=>nil,
                             #     :tax_receiver_id=>nil}

wallet_journal_entry.amount # => 87375.0
wallet_journal_entry.balance # => 2405126.01
wallet_journal_entry.context_id # => 30003498
wallet_journal_entry.context_id_type # => "system_id"
wallet_journal_entry.date # => Sun, 08 Mar 2020 12:08:25 UTC +00:00
wallet_journal_entry.description # => "Johnn Dillinger got bounty prizes for killing pirates in Sharhelund"
wallet_journal_entry.first_party_id # => 1000125
wallet_journal_entry.wallet_journal_id # => 17740466914
wallet_journal_entry.reason # => "3744: 2,3748: 2,18085: 2,18070: 1"
wallet_journal_entry.ref_type # => "bounty_prizes"
wallet_journal_entry.second_party_id # => 1337512245
wallet_journal_entry.tax # => nil
wallet_journal_entry.tax_receiver_id # => nil
```

#### Get wallet transactions

```ruby
options = { token: "token123", character_id: 1_337_512_245 } # optional, add `from_id: 123` to skip records

wallet_transactions = EveOnline::ESI::CharacterWalletTransactions.new(options)

wallet_transactions.scope # => "esi-wallet.read_character_wallet.v1"

wallet_transactions.wallet_transactions.size # => 47

wallet_transaction = wallet_transactions.wallet_transactions.first

wallet_transaction.as_json # => {:client_id=>2116253203,
                           #     :date=>Sun, 08 Mar 2020 11:49:16 UTC +00:00,
                           #     :is_buy=>true,
                           #     :is_personal=>true,
                           #     :journal_ref_id=>17740411474,
                           #     :location_id=>60008494,
                           #     :quantity=>1,
                           #     :transaction_id=>5296927639,
                           #     :type_id=>3538,
                           #     :unit_price=>99887.79}

wallet_transaction.client_id # => 2116253203
wallet_transaction.date # => Sun, 08 Mar 2020 11:49:16 UTC +00:00
wallet_transaction.is_buy # => true
wallet_transaction.is_personal # => true
wallet_transaction.journal_ref_id # => 17740411474
wallet_transaction.location_id # => 60008494
wallet_transaction.quantity # => 1
wallet_transaction.transaction_id # => 5296927639
wallet_transaction.type_id # => 3538
wallet_transaction.unit_price # => 99887.79
```

#### Returns a corporation's wallet balance

```ruby
```

#### Get corporation wallet journal

```ruby
```

#### Get corporation wallet transactions

```ruby
```

### Wars

#### List wars

```ruby
wars = EveOnline::ESI::Wars.new

wars.scope # => nil

wars.war_ids.size # => 2000

wars.war_ids.first # => 629019

# with max_war_id

options = { max_war_id: 10 }

wars = EveOnline::ESI::Wars.new(options)

wars.war_ids.size # => 9

wars.war_ids.first # => 9
```

#### Get war information

```ruby
options = { id: 615578 }

war = EveOnline::ESI::War.new(options)

war.scope # => nil

war.as_json # => {:declared=>Fri, 14 Sep 2018 10:42:03 UTC +00:00,
            #     :finished=>Thu, 20 Sep 2018 03:52:00 UTC +00:00,
            #     :war_id=>615578,
            #     :mutual=>false,
            #     :open_for_allies=>false,
            #     :retracted=>nil,
            #     :started=>Fri, 14 Sep 2018 10:42:03 UTC +00:00}

war.declared # => Fri, 14 Sep 2018 10:42:03 UTC +00:00
war.finished # => Thu, 20 Sep 2018 03:52:00 UTC +00:00
war.war_id # => 615578
war.mutual # => false
war.open_for_allies # => false
war.retracted # => nil
war.started # => Fri, 14 Sep 2018 10:42:03 UTC +00:00

war.aggressor.as_json # => {:alliance_id=>99008592,
                      #     :corporation_id=>nil,
                      #     :isk_destroyed=>222167.22000000003,
                      #     :ships_killed=>9}

aggressor = war.aggressor

aggressor.alliance_id # => 99008592
aggressor.corporation_id # => nil
aggressor.isk_destroyed # => 222167.22000000003
aggressor.ships_killed # => 9

war.allies.size # => 3

ally = war.allies.first

ally.as_json # => {:alliance_id=>99008228,
             #     :corporation_id=>nil}

ally.alliance_id # => 99008228
ally.corporation_id # => nil

war.defender.as_json # => {:alliance_id=>99008228,
                     #     :corporation_id=>nil,
                     #     :isk_destroyed=>0.0,
                     #     :ships_killed=>0}

defender = war.defender

defender.alliance_id # => 99008228
defender.corporation_id # => nil
defender.isk_destroyed # => 0.0
defender.ships_killed # => 0
```

#### List kills for a war

```ruby
options = { war_id: 615578, page: 1 }

war_killmails = EveOnline::ESI::WarKillmails.new(options)

war_killmails.scope # => nil

war_killmails.page # => 1

war_killmails.total_pages # => 1

war_killmails.killmails.size # => 9

killmail = war_killmails.killmails.first

killmail.as_json # => {:killmail_hash=>"07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5",
                 #     :killmail_id=>72410059}

killmail.killmail_hash # => "07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5"
killmail.killmail_id # => 72410059
```

## Exceptions

If you want to catch all exceptions `rescue` `EveOnline::Exceptions::Base`. E.g.:

```ruby
begin
  races = EveOnline::ESI::UniverseRaces.new

  race = races.races.first

  race.as_json
rescue EveOnline::Exceptions::Base
  # some logic for handle exception
end
```

List of exceptions:

* `EveOnline::Exceptions::NoContent` when response returns status 204 without body.
* `EveOnline::Exceptions::BadRequest` when response returns status 400.
* `EveOnline::Exceptions::Unauthorized` when response returns status 401.
* `EveOnline::Exceptions::Forbidden` when response returns status 403.
* `EveOnline::Exceptions::ResourceNotFound` when response returns status 404.
* `EveOnline::Exceptions::InternalServerError` when response returns status 500.
* `EveOnline::Exceptions::BadGateway` when response returns status 502.
* `EveOnline::Exceptions::ServiceUnavailable` when response returns status 503.
* `EveOnline::Exceptions::Timeout` when timeout.

## Timeouts

`eve_online` gem uses `faraday` for network request. `faraday` configured with:

```ruby
Faraday.new do |f|
  f.options.read_timeout = 60
  f.options.open_timeout = 60
  f.options.write_timeout = 60
end
```

You can configure default timeouts with adding `read_timeout:`, `open_timeout:` and `write_timeout:` to default hash with options:

```ruby
options = { read_timeout: 120, open_timeout: 120, write_timeout: 120 } # 120 seconds

races = EveOnline::ESI::UniverseRaces.new(options)
```

Or, dynamically:

```ruby
races = EveOnline::ESI::UniverseRaces.new

races.open_timeout # => 60
races.open_timeout = 120
races.open_timeout # => 120

races.read_timeout # => 60
races.read_timeout = 120
races.read_timeout # => 120

races.write_timeout # => 60
races.write_timeout = 120
races.write_timeout # => 120
```

## Languages support

Default language is `en-us`. Supported languages: `de`, `en-us`, `fr`, `ja`, `ru`, `zh`, `ko`.

If you want change it, for e.g., to `de`, add `language: 'de'` to default hash with options:

```ruby
options = { language: 'de' }

races = EveOnline::ESI::UniverseRaces.new(options)
```

## Oj as JSON Parser

```ruby
require 'oj'

Oj.mimic_JSON()

races = EveOnline::ESI::UniverseRaces.new
```

## Formulas

### Blueprint copy time

```ruby
seconds = 240 # 240 seconds it time to copy e.g. "Acolyte I Blueprint"
science_level = 5 # character science level
advanced_industry_level = 1 # character advanced industry level
science_copy_speed_bonus_per_level = -5.00 # type dogma attribute copy speed bonus for science
advanced_industry_skill_industry_job_time_bonus_per_level = -3.00 # type dogma attribute industry job time bonuse for advanced industry
runs = 1 # number of copy, optional. default: 1

formula = EveOnline::Formulas::BlueprintCopyTime.new(seconds, science_level,
  advanced_industry_level, science_copy_speed_bonus_per_level,
  advanced_industry_skill_industry_job_time_bonus_per_level, runs)

# time of copy in seconds
formula.time # => 174.6
```

### Training rate

```ruby
# Memory: 24
primary = 24
# Charisma: 20
secondary = 20

training_rate = EveOnline::Formulas::TrainingRate.new(primary, secondary)

# skill points per minute
training_rate.rate # => 34.0
```

## Useful links

* [BREAKING CHANGES AND YOU - HOW TO USE ALT-ROUTES TO ENHANCE YOUR SANITY](https://developers.eveonline.com/blog/article/breaking-changes-and-you)
* [TECHNICAL NOTE: INTEGER SIZES AND THE XML API](https://developers.eveonline.com/blog/article/technical-note-integer-sizes-and-the-xml-api)
* [THE END OF PUBLIC CREST AS WE KNOW IT](https://developers.eveonline.com/blog/article/the-end-of-public-crest-as-we-know-it)
* [CCP, zKillboard (Eve-Kill), and your API](https://docs.google.com/document/d/16YfJwjhuH5A3cS4NTMDFDkprnOVKsvgtuRIKk8xjTM8/edit)
* [JUMP CLONES, IMPLANTS, SKILLS, AND MORE](https://developers.eveonline.com/blog/article/jump-clones-implants-skills-and-more)
* [ESI Swagger](https://esi.evetech.net/ui/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at <https://github.com/evemonk/eve_online>.

## Author

* Ihor Zubkov (@biow0lf)

## Contributors

Thank you everyone!

* Ian Flynn (@monban)
* Mekaret Eriker (@Mekaret)
* Y. (@lunohodov)
* Trevor Copeland (@sicks)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
