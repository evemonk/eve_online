# EveOnline API (XML and CREST)

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Code Climate](https://codeclimate.com/github/biow0lf/eve_online/badges/gpa.svg)](https://codeclimate.com/github/biow0lf/eve_online)
[![Test Coverage](https://codeclimate.com/github/biow0lf/eve_online/badges/coverage.svg)](https://codeclimate.com/github/biow0lf/eve_online/coverage)
[![Build Status](https://travis-ci.org/biow0lf/eve_online.svg?branch=master)](https://travis-ci.org/biow0lf/eve_online)
[![Dependency Status](https://gemnasium.com/biow0lf/eve_online.svg)](https://gemnasium.com/biow0lf/eve_online)
[![security](https://hakiri.io/github/biow0lf/eve_online/master.svg)](https://hakiri.io/github/biow0lf/eve_online/master)

This gem implement Ruby API for EveOnline MMORPG. Both, XML and CREST API.

This gem was extracted from [EveMonk](http://evemonk.com). Source code of evemonk backend published [here](https://github.com/biow0lf/evemonk).

You will need to add xml parser to your Gemfile to use this gem. E.g. `nokogiri`. Or any other xml parser which are supported by nori.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eve_online'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eve_online

## Supported ruby versions:

 * MRI 1.9.3
 * MRI 2.0
 * MRI 2.1
 * MRI 2.2
 * MRI 2.3
 * Rubinius (latest via RVM)
 * JRuby (latest via RVM)

## Usage

Account status:

```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

account_status = EveOnline::Account::Status.new(key_id, v_code)

account_status.as_json
# => {:current_time=>Mon, 23 Nov 2015 18:53:46 UTC +00:00, :paid_until=>Mon, 28 Dec 2015 18:12:56 UTC +00:00, :create_date=>Fri, 15 Jan 2010 15:11:00 UTC +00:00, :logon_count=>388, :logon_minutes=>15598, :cached_until=>Mon, 23 Nov 2015 19:28:38 UTC +00:00}

account_status.current_time # => Mon, 23 Nov 2015 18:53:46 UTC +00:00
account_status.paid_until # => Mon, 28 Dec 2015 18:12:56 UTC +00:00
account_status.create_date # => Fri, 15 Jan 2010 15:11:00 UTC +00:00
account_status.logon_count # => 388
account_status.logon_minutes # => 15598
account_status.cached_until # => Mon, 23 Nov 2015 19:28:38 UTC +00:00
account_status.version # => 2
```

Characters:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

characters = EveOnline::Account::Characters.new(key_id, v_code)
characters.version # => 2
characters.current_time # => Mon, 30 Nov 2015 23:31:31 UTC +00:00
characters.cached_until # => Tue, 01 Dec 2015 00:28:31 UTC +00:00

characters.characters.size # => 2

character = characters.characters.first

character.as_json
# => {:character_id=>90729314, :character_name=>"Green Black", :corporation_id=>1000168, :corporation_name=>"Federal Navy Academy", :alliance_id=>0, :alliance_name=>"", :faction_id=>0, :faction_name=>""}

character.character_id # => 90729314
character.character_name # => "Green Black"
character.corporation_id # => 1000168
character.corporation_name # => "Federal Navy Academy"
character.alliance_id # => 0
character.alliance_name # => ""
character.faction_id # => 0
character.faction_name # => ""
```

Api Key Info:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'

api_key_info = EveOnline::Account::ApiKeyInfo.new(key_id, v_code)

api_key_info.expires # => Fri, 02 Dec 2016 18:13:59 UTC +00:00
api_key_info.type # => "Account"
# TODO: check this
# irb(main):029:0> api_key_info.type
# => "Character"
api_key_info.access_mask # => 1073741823
api_key_info.version # => 2
api_key_info.current_time # => Mon, 30 Nov 2015 23:00:38 UTC +00:00
api_key_info.cached_until # => Mon, 30 Nov 2015 23:05:38 UTC +00:00

api_key_info.characters.size # => 2

character = api_key_info.characters.first

character.as_json
# => {:character_id=>90729314, :character_name=>"Green Black", :corporation_id=>1000168, :corporation_name=>"Federal Navy Academy", :alliance_id=>0, :alliance_name=>"", :faction_id=>0, :faction_name=>""}

character.character_id # => 90729314
character.character_name # => "Green Black"
character.corporation_id # => 1000168
character.corporation_name # => "Federal Navy Academy"
character.alliance_id # => 0
character.alliance_name # => ""
character.faction_id # => 0
character.faction_name # => ""
```

Accounts Balance:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

account_balance = EveOnline::Characters::AccountBalance.new(key_id, v_code, character_id)

account_balance.as_json
# => {:account_id=>42763123, :account_key=>1000, :balance=>"5000.00", :current_time=>Wed, 02 Dec 2015 20:29:32 UTC +00:00, :cached_until=>Wed, 02 Dec 2015 20:40:42 UTC +00:00}

account_balance.account_id # => 42763123
account_balance.account_key # => 1000
account_balance.balance # => "5000.00"
account_balance.current_time # => Wed, 02 Dec 2015 20:29:32 UTC +00:00
account_balance.cached_until # => Wed, 02 Dec 2015 20:40:42 UTC +00:00
account_balance.version # => 2
```

Asset List:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

asset_list = EveOnline::Characters::AssetList.new(key_id, v_code, character_id)

asset_list.current_time # => Mon, 29 Feb 2016 21:51:38 UTC +00:00
asset_list.cached_until # => Tue, 01 Mar 2016 03:48:38 UTC +00:00
asset_list.version # => 2

asset_list.assets.size # => 642

asset = asset_list.assets.first

asset.as_json
# => {:item_id=>408887580, :location_id=>60000634, :type_id=>588, :quantity=>1, :flag=>4, :singleton=>1, :raw_quantity=>-1}

asset.item_id # => 408887580
asset.location_id # => 60000634
asset.type_id # => 588
asset.quantity # => 1
asset.flag # => 4
asset.singleton # => 1
asset.raw_quantity # => -1
```

Blueprints:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

blueprints = EveOnline::Characters::Blueprints.new(key_id, v_code, character_id)

blueprints.current_time # => Sun, 03 Jan 2016 14:36:37 UTC +00:00 
blueprints.cached_until # => Mon, 04 Jan 2016 02:06:37 UTC +00:00 
blueprints.version # => 2 

blueprints.blueprints.size # => 4

blueprint = blueprints.blueprints.first

blueprint.as_json
# => {:item_id=>716338097, :location_id=>61000032, :type_id=>1010, :type_name=>"Small Shield Extender I Blueprint", :flag_id=>4, :quantity=>-2, :time_efficiency=>0, :material_efficiency=>10, :runs=>300}

blueprint.item_id # => 716338097
blueprint.location_id # => 61000032
blueprint.type_id # => 1010
blueprint.type_name # => "Small Shield Extender I Blueprint"
blueprint.flag_id # => 4
blueprint.quantity # => -2
blueprint.time_efficiency # => 0
blueprint.material_efficiency # => 10
blueprint.runs # => 300
```

Bookmarks:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

bookmarks = EveOnline::Characters::Bookmarks.new(key_id, v_code, character_id)

bookmarks.current_time # => Sun, 03 Jan 2016 14:53:44 UTC +00:00 
bookmarks.cached_until # => Sun, 03 Jan 2016 15:50:44 UTC +00:00 
bookmarks.version # => 2 

# TODO: finish this

```

Calendar Event Attendees:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314
event_id = 1234567

cea = EveOnline::Characters::CalendarEventAttendees.new(key_id, v_code, character_id, event_id)

cea.current_time # => Mon, 21 Dec 2015 18:36:33 UTC +00:00
cea.cached_until # => Mon, 21 Dec 2015 18:36:33 UTC +00:00
cea.version # => 2

# TODO: finish this

````

Skill In Training:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314


skill_in_training = EveOnline::Characters::SkillInTraining.new(key_id, v_code, character_id)

skill_in_training.current_time # => Sun, 03 Jan 2016 16:09:15 UTC +00:00 
skill_in_training.cached_until # => Sun, 03 Jan 2016 16:51:29 UTC +00:00 
skill_in_training.version # => 2 

skill_in_training.as_json
# => {:current_tq_time=>Sun, 03 Jan 2016 16:09:15 UTC +00:00, :training_end_time=>Wed, 13 Jan 2016 16:38:31 UTC +00:00, :training_start_time=>Wed, 23 Dec 2015 11:35:45 UTC +00:00, :training_type_id=>30651, :training_start_sp=>226275, :training_destination_sp=>1280000, :training_to_level=>5, :skill_in_training=>1} 

skill_in_training.current_tq_time # => Sun, 03 Jan 2016 16:09:15 UTC +00:00 
skill_in_training.training_end_time # => Wed, 13 Jan 2016 16:38:31 UTC +00:00 
skill_in_training.training_start_time # => Wed, 23 Dec 2015 11:35:45 UTC +00:00 
skill_in_training.training_type_id # => 30651 
skill_in_training.training_start_sp # => 226275 
skill_in_training.training_destination_sp # => 1280000 
skill_in_training.training_to_level # => 5 
skill_in_training.skill_in_training # => 1 
```

Upcoming Calender Events:
```ruby
key_id = 1234567
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
character_id = 90729314

upcoming_events = EveOnline::Characters::UpcomingCalendarEvents.new(key_id, v_code, character_id)

upcoming_events.current_time # => Thu, 17 Dec 2015 20:43:46 UTC +00:00
upcoming_events.cached_until # => Thu, 17 Dec 2015 21:40:46 UTC +00:00
upcoming_events.version # => 2

upcoming_events.events.size # => 2

event = upcoming_events.events.first

event.as_json
# => {:event_id=>1234567, :owner_id=>98765432, :owner_name=>"MyCorp", :event_date=>Sat, 26 Dec 2015 19:47:29 UTC +00:00, :event_title=>"Control tower in 99-999", :duration=>60, :importance=>false, :response=>:undecided, :event_text=>"<b>Minmatar Control Tower</b> will run out of fuel and go offline...", :owner_type_id=>2}

event.event_id # => 1234567
event.owner_id # => 98765432
event.owner_name # => "MyCorp"
event.event_date # => Sat, 26 Dec 2015 19:47:29 UTC +00:00
event.event_title # => "Control tower in 99-999"
event.duration # => 60
event.importance # => false
event.response # => :undecided
event.event_text # => "<b>Minmatar Control Tower</b> will run out of fuel and go offline..."
event.owner_type_id # => 2
```

Character Names ot IDs:
```ruby
input = ['Johnn Dillinger'] # => ["Johnn Dillinger"]

characters_ids = EveOnline::Eve::CharacterID.new(input)

characters_ids.current_time # => Mon, 11 Apr 2016 18:51:01 UTC +00:00
characters_ids.cached_until # => Wed, 11 May 2016 18:51:01 UTC +00:00
characters_ids.version # => 2

characters_ids.response # => {"eveapi"=>{"currentTime"=>"2016-04-11 18:51:01", "result"=>{"rowset"=>{"row"=>{"@name"=>"Johnn Dillinger", "@characterID"=>"1337512245"}, "@name"=>"characters", "@key"=>"characterID", "@columns"=>"name,characterID"}}, "cachedUntil"=>"2016-05-11 18:51:01", "@version"=>"2"}}
```

Server status:

```ruby
status = EveOnline::Server::Status.new

status.as_json
# => {:current_time=>Mon, 23 Nov 2015 18:18:29 UTC +00:00, :cached_until=>Mon, 23 Nov 2015 18:19:44 UTC +00:00, :server_open=>true, :online_players=>25611}

status.current_time # => Mon, 23 Nov 2015 18:18:29 UTC +00:00
status.cached_until # => Mon, 23 Nov 2015 18:19:44 UTC +00:00
status.server_open? # => true
status.online_players # => 25611
status.version # => 2
```

## CREST Examples

Sovereignty campaigns:

```ruby
campaigns = EveOnline::Sovereignty::Campaigns.new

campaigns.total_count # => 205
campaigns.page_count # => 1

campaigns.items.class # => Array

campaigns.items.size # => 205

campaigns.items.first
# => {"eventType_str"=>"1", "campaignID"=>21773, "eventType"=>1, "sourceSolarsystem"=>{"id_str"=>"30003629", "href"=>"https://crest-tq.eveonline.com/solarsystems/30003629/", "id"=>30003629, "name"=>"S-KSWL"}, "attackers"=>{"score"=>0.8}, "campaignID_str"=>"21773", "sourceItemID"=>1020806305659, "startTime"=>"2016-05-04T15:43:16", "sourceItemID_str"=>"1020806305659", "defender"=>{"defender"=>{"id_str"=>"99006297", "href"=>"https://crest-tq.eveonline.com/alliances/99006297/", "id"=>99006297, "name"=>"DRONE WALKERS"}, "score"=>0.2}, "constellation"=>{"id_str"=>"20000529", "href"=>"https://crest-tq.eveonline.com/constellations/20000529/", "id"=>20000529, "name"=>"TJ10-O"}}
```

## Useful links

* [TECHNICAL NOTE: INTEGER SIZES AND THE XML API](https://developers.eveonline.com/blog/article/technical-note-integer-sizes-and-the-xml-api)
* [THE END OF PUBLIC CREST AS WE KNOW IT](https://developers.eveonline.com/blog/article/the-end-of-public-crest-as-we-know-it)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Changelog

**v0.7.0**

* Drop `nokogiri` gem from gem dependency
* Add `json` gem for CREST API
* Add `EveOnline::Item` for handle items in AssetList
* [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_assetlist.html)
* Remove unused `EveOneline::Skill` and `EveOnline::SkillGroup` classes
* Add `EveOnline::BookmarkFolder` class for handling bookmarks folders
* Add `EveOnline::Bookmark` class for handling EveOnline Bookmarks
* Remove unused `EveOnline::Eve::SkillTree` class
* Relax activesupport version requirement (now requires 3.0.0 or later)
* Respect EveOnline API guidelines. Set correct user agent.
* Add basic `EveOnline::Sovereignty::Campaigns` class
* Add basic `EveOnline::Eve::CharacterID` to handle character name to character id requests
* Add `EveOnline::BaseXML` as base for XML API
* Add `EveOnline::BaseCREST` as base for CREST API
* Citadel 1.0 updates

**v0.6.0**

* Add `EveOnline::EventResponseObject` class for handling EveOnline Event response values
* `EveOnline::Event#response` now returns symbols. e.g. `:undecided`
* [Character Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_blueprints.html)
* Add `EveOnline::Blueprint` class for handling EveOnline Blueprints
* Add basic [Character Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
* [Characters SkillInTraining](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillintraining.html)

**v0.5.0**

* Add `EveOnline::Event` class for handling EveOnline Events
* `EveOnline::Account::ApiKeyInfo#expires` now returns time with timezone
* [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_upcomingcalendarevents.html)
* Basic [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_calendareventattendees.html)

**v0.4.0**:

* Time zone fixes
* Add `EveOnline::Character` class for handling each Character
* `EveOnline::Account::Characters` and `EveOnline::Account::ApiKeyInfo` now supports multiple characters
* Fix `EveOnline::Characters::AccountBalance` class
* Fix `EveOnline::Characters::AccountBalance#account_key`
* Add `#as_json` methods

**v0.3.0**:

* [Characters](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account/account_characters.html)
* Refactoring and bug fixes

**v0.2.0**:

* [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_accountbalance.html)
* [API Key Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_apikeyinfo.html)
* [Account Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_accountstatus.html)

**v0.1.0**:

* [Server Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/server/serv_serverstatus.html)

## Implementation check list:

### Account

- [x] [Account Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_accountstatus.html)
- [x] [API Key Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_apikeyinfo.html)
- [x] [Characters](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/account/account_characters.html)

----

### Api

- [ ] [Call List (Access Mask reference)](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/api/api_calllist.html)

----

### Character

- [x] [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_accountbalance.html)
- [x] [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_assetlist.html)
- [x] [Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_blueprints.html)
- [ ] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
- [ ] [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_calendareventattendees.html)
- [ ] [Character Sheet](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_charactersheet.html)
- [ ] [Chat Channels](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_chatchannels.html)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactlist.html)
- [ ] [Contact Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactnotifications.html)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contractbids.html)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contractitems.html)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contracts.html)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_facwarstats.html)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_industryjobs.html)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_industryjobshistory.html)
- [ ] [Kill Log](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_killlog.html)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_killmails.html)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_locations.html)
- [ ] [Mail Bodies](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailbodies.html)
- [ ] [Mailing Lists](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailinglists.html)
- [ ] [Mail Messages](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_mailmessages.html)
- [ ] [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_marketorders.html)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_medals.html)
- [ ] [Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_notifications.html)
- [ ] [Notification Texts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_notificationtexts.html)
- [ ] [Planetary Colonies](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarycolonies.html)
- [ ] [Planetary Links](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarylinks.html)
- [ ] [Planetary Pins](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetarypins.html)
- [ ] [Planetary Routes](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_planetaryroutes.html)
- [ ] [Research](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_research.html)
- [x] [Skill in Training](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillintraining.html)
- [ ] [Skill Queue](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html)
- [ ] [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html)
- [x] [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_upcomingcalendarevents.html)
- [ ] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_wallettransactions.html)

----

### Corporation

- [ ] [Account Balance](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_accountbalance.html)
- [ ] [Asset List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_assetlist.html)
- [ ] [Blueprints](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_blueprints.html)
- [ ] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_bookmarks.html)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contactlist.html)
- [ ] [Container Log](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_containerlog.html)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contractbids.html)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contractitems.html)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_contracts.html)
- [ ] [Corporation Sheet](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_corporationsheet.html)
- [ ] [Customs Offices](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_customsoffices.html)
- [ ] [Facilities](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_facilities.html)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_facwarstats.html)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_industryjobs.html)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_industryjobshistory.html)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_killmails.html)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_locations.html)
- [ ] [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_marketorders.html)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_medals.html)
- [ ] [Member Medals](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membermedals.html)
- [ ] [Member Security](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membersecurity.html)
- [ ] [Member Security Log](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membersecuritylog.html)
- [ ] [Member Tracking](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_membertracking.html)
- [ ] [Outpost List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_outpostlist.html)
- [ ] [Outpost Service Detail](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_outpostservicedetail.html)
- [ ] [Shareholders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_shareholders.html)
- [ ] [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_standings.html)
- [ ] [Starbase Detail](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_starbasedetail.html)
- [ ] [Starbase List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_starbaselist.html)
- [ ] [Titles](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_titles.html)
- [ ] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_walletjournal.html)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_wallettransactions.html)

----

### Eve

- [ ] [Alliance List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_alliancelist.html)
- [ ] [Character Affiliation](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characteraffiliation.html)
- [ ] [Character ID](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characterid.html)
- [ ] [Character Info](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_characterinfo.html)
- [ ] [Character Name](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_charactername.html)
- [ ] [Conquerable Station List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_conquerablestationlist.html)
- [ ] [Error List](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_errorlist.html)
- [ ] [Ref Types](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_reftypes.html)
- [ ] [Type Name](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/eve/eve_typename.html)

----

### Map

- [ ] [Factional Warfare Systems](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_facwarsystems.html)
- [ ] [Jumps](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_jumps.html)
- [ ] [Kills](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_kills.html)
- [ ] [Sovereignty](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/map/map_sovereignty.html)

----

### Server

- [x] [Server Status](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/server/serv_serverstatus.html)

----

## TODO

- [ ] Account Status: Support multiCharacterTraining
- [ ] Access Mask
- [ ] Caching
- [ ] Test EVE server

## Author

* Igor Zubkov (@biow0lf)

## Contributors. Thank you everyone!

* Ian Flynn (@monban)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
