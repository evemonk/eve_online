# EveOnline API (XML and CREST)

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Code Climate](https://codeclimate.com/github/biow0lf/eve_online/badges/gpa.svg)](https://codeclimate.com/github/biow0lf/eve_online)
[![Test Coverage](https://codeclimate.com/github/biow0lf/eve_online/badges/coverage.svg)](https://codeclimate.com/github/biow0lf/eve_online/coverage)
[![Build Status](https://travis-ci.org/biow0lf/eve_online.svg?branch=master)](https://travis-ci.org/biow0lf/eve_online)
[![Dependency Status](https://gemnasium.com/biow0lf/eve_online.svg)](https://gemnasium.com/biow0lf/eve_online)
[![security](https://hakiri.io/github/biow0lf/eve_online/master.svg)](https://hakiri.io/github/biow0lf/eve_online/master)

This gem implement Ruby API for EveOnline MMORPG. Both, XML and CREST API.

You will need to add xml parser to your Gemfile to use this gem. E.g. nokogiri. Or any other xml parser which are supported by nori.

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

bp = blueprints.blueprints.first

bp.as_json
# => {:item_id=>716338097, :location_id=>61000032, :type_id=>1010, :type_name=>"Small Shield Extender I Blueprint", :flag_id=>4, :quantity=>-2, :time_efficiency=>0, :material_efficiency=>10, :runs=>300}

bp.item_id # => 716338097
bp.location_id # => 61000032
bp.type_id # => 1010
bp.type_name # => "Small Shield Extender I Blueprint"
bp.flag_id # => 4
bp.quantity # => -2
bp.time_efficiency # => 0
bp.material_efficiency # => 10
bp.runs # => 300
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

Skill Tree:
```ruby
skill_tree = EveOnline::Eve::SkillTree.new

skill_tree.current_time # => Mon, 21 Dec 2015 22:24:48 UTC +00:00
skill_tree.cached_until # => Tue, 22 Dec 2015 22:24:48 UTC +00:00
skill_tree.version # => 2

# TODO: finish this

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Changelog

**master**

* Drop nokogiri from gem dependency
* Add `EveOnline::Item` for handle items in AssetList
* [Asset List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_assetlist/)

**v0.6.0**

* Add `EveOnline::EventResponseObject` class for handling EveOnline Event response values
* `EveOnline::Event#response` now returns symbols. e.g. `:undecided`
* [Character Blueprints](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_blueprints/)
* Add `EveOnline::Blueprint` class for handling EveOnline Blueprints
* Add basic [Character Bookmarks](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_bookmarks/)
* [Characters SkillInTraining](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_skillintraining/)

**v0.5.0**

* Add `EveOnline::Event` class for handling EveOnline Events
* `EveOnline::Account::ApiKeyInfo#expires` now returns time with timezone
* [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_upcomingcalendarevents/)
* Basic [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_calendareventattendees/)

**v0.4.0**:

* Time zone fixes
* Add `EveOnline::Character` class for handling each Character
* `EveOnline::Account::Characters` and `EveOnline::Account::ApiKeyInfo` now supports multiple characters
* Fix `EveOnline::Characters::AccountBalance` class
* Fix `EveOnline::Characters::AccountBalance#account_key`
* Add #as_json methods

**v0.3.0**:

* [Characters](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_characters/)
* Refactoring and bug fixes

**v0.2.0**:

* [Account Balance](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_accountbalance/)
* [API Key Info](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_apikeyinfo/)
* [Account Status](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_accountstatus/)

**v0.1.0**:

* [Server Status](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/serv_serversstatus/)

## Implementation check list:

### Account

- [x] [Account Status](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_accountstatus/)
- [x] [API Key Info](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_apikeyinfo/)
- [x] [Characters](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/account_characters/)

----

### Api

- [ ] [Call List (Access Mask reference)](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/api_calllist/)

----

### Character

- [x] [Account Balance](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_accountbalance/)
- [x] [Asset List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_assetlist/)
- [x] [Blueprints](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_blueprints/)
- [ ] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_bookmarks/)
- [ ] [Calendar Event Attendees](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_calendareventattendees/)
- [ ] [Character Sheet](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_charactersheet/)
- [ ] [Chat Channels](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_chatchannels/)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_contactlist/)
- [ ] [Contact Notifications](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_contactnotifications/)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_contractbids/)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_contractitems/)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_contracts/)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_facwarstats/)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_industryjobs.md)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_industryjobshistory.md)
- [ ] [Kill Log](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_killlog.md)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_killmails.md)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_locations.md)
- [ ] [Mail Bodies](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_mailbodies.md)
- [ ] [Mailing Lists](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_mailinglists/)
- [ ] [Mail Messages](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_mailmessages/)
- [ ] [Market Orders](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_marketorders/)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_medals.md)
- [ ] [Notifications](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_notifications.md)
- [ ] [Notification Texts](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/char_notificationtexts.md)
- [ ] [Planetary Colonies](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_planetarycolonies/)
- [ ] [Planetary Links](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_planetarylinks/)
- [ ] [Planetary Pins](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_planetarypins/)
- [ ] [Planetary Routes](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_planetaryroutes/)
- [ ] [Research](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_research/)
- [x] [Skill in Training](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_skillintraining/)
- [ ] [Skill Queue](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_skillqueue/)
- [ ] [Standings](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_standings/)
- [x] [Upcoming Calendar Events](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_upcomingcalendarevents/)
- [ ] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_walletjournal/)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/char_wallettransactions/)

----

### Corporation

- [ ] [Account Balance](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/corp_accountbalance/)
- [ ] [Asset List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_assetlist.md)
- [ ] [Blueprints](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_blueprints.md)
- [ ] [Bookmarks](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/corp_bookmarks/)
- [ ] [Contact List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_contactlist.md)
- [ ] [Container Log](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_containerlog.md)
- [ ] [Contract Bids](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_contractbids.md)
- [ ] [Contract Items](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_contractitems.md)
- [ ] [Contracts](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_contracts.md)
- [ ] [Corporation Sheet](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_corporationsheet.md)
- [ ] [Customs Offices](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_customsoffices.md)
- [ ] [Facilities](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_facilities.md)
- [ ] [Factional Warfare Stats](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_facwarstats.md)
- [ ] [Industry Jobs](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_industryjobs.md)
- [ ] [Industry Jobs History](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_industryjobshistory.md)
- [ ] [Kill Mails](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_killmails.md)
- [ ] [Locations](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_locations.md)
- [ ] [Market Orders](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_marketorders.md)
- [ ] [Medals](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_medals.md)
- [ ] [Member Medals](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_membermedals.md)
- [ ] [Member Security](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_membersecurity.md)
- [ ] [Member Security Log](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_membersecuritylog.md)
- [ ] [Member Tracking](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_membertracking.md)
- [ ] [Outpost List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_outpostlist.md)
- [ ] [Outpost Service Detail](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_outpostservicedetail.md)
- [ ] [Shareholders](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_shareholders.md)
- [ ] [Standings](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_standings.md)
- [ ] [Starbase Detail](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_starbasedetail.md)
- [ ] [Starbase List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_starbaselist.md)
- [ ] [Titles](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/endpoints/corp_titles.md)
- [ ] [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/corp_walletjournal/)
- [ ] [Wallet Transactions](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/corp_wallettransactions/)

----

### Eve

- [ ] [Alliance List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_alliancelist/)
- [ ] [Character Affiliation](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_characteraffiliation/)
- [ ] [Character ID](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_characterid/)
- [ ] [Character Info](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_characterinfo/)
- [ ] [Character Name](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_charactername/)
- [ ] [Conquerable Station List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_conquerablestationlist/)
- [ ] [Error List](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_errorlist/)
- [ ] [Ref Types](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_reftypes/)
- [ ] [Type Name](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_typename/)

----

### Map

- [ ] [Factional Warfare Systems](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/map_facwarsystems/)
- [ ] [Jumps](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/map_jumps/)
- [ ] [Kills](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/map_kills/)
- [ ] [Sovereignty](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/map_sovereignty/)

----

### Misc

- [ ] [Image (ID to Character Portrait and Corporation/Alliance Logo) (TODO: recheck this)](http://wiki.eve-id.net/APIv2_Eve_Image_Service)
- [ ] [Old Portraits (TODO: recheck this)](http://wiki.eve-id.net/APIv2_Old_Portraits)

----

### Server

- [x] [Server Status](https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/serv_serversstatus/)

----

## TODO

- [ ] Account Status: Support multiCharacterTraining
- [ ] Access Mask
- [ ] Caching
- [ ] Test EVE server

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
