# EveOnline API (XML and CREST)

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Code Climate](https://codeclimate.com/github/biow0lf/eve_online/badges/gpa.svg)](https://codeclimate.com/github/biow0lf/eve_online)
[![Test Coverage](https://codeclimate.com/github/biow0lf/eve_online/badges/coverage.svg)](https://codeclimate.com/github/biow0lf/eve_online/coverage)
[![Build Status](https://travis-ci.org/biow0lf/eve_online.svg?branch=master)](https://travis-ci.org/biow0lf/eve_online)
[![Dependency Status](https://gemnasium.com/biow0lf/eve_online.svg)](https://gemnasium.com/biow0lf/eve_online)
[![security](https://hakiri.io/github/biow0lf/eve_online/master.svg)](https://hakiri.io/github/biow0lf/eve_online/master)

This gem implement Ruby API for EveOnline MMORPG. Both, XML and CREST API.

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
 * Rubinius (latest via RVM)
 * JRuby (latest via RVM)

## Usage

Server status:

```ruby
status = EveOnline::Server::Status.new
status.as_json # => {:current_time=>Mon, 23 Nov 2015 18:18:29 UTC +00:00, :cached_until=>Mon, 23 Nov 2015 18:19:44 UTC +00:00, :server_open=>true, :online_players=>25611}

status.current_time # => Mon, 23 Nov 2015 18:18:29 UTC +00:00
status.cached_until # => Mon, 23 Nov 2015 18:19:44 UTC +00:00
status.server_open? # => true
status.online_players # => 25611
status.version # => 2
```

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Changelog

**master**:

* Add `EveOnline::Event` class for handling EveOnline Events.
* `EveOnline::Account::ApiKeyInfo#expires` now returns time with timezone.

**v0.4.0**:

* Time zone fixes.
* Add `EveOnline::Character` class for handling each Character.
* `EveOnline::Account::Characters` and `EveOnline::Account::ApiKeyInfo` now supports multiple characters.
* Fix `EveOnline::Characters::AccountBalance` class.
* Fix `EveOnline::Characters::AccountBalance#account_key`.
* Add #as_json methods.

**v0.3.0**:

* [Account Characters XML](http://wiki.eve-id.net/APIv2_Account_Characters_XML).
* Refactoring and bug fixes.

**v0.2.0**:

* [Character Account Balance XML](http://wiki.eve-id.net/APIv2_Char_AccountBalance_XML).
* [Account APIKeyInfo XML](http://wiki.eve-id.net/APIv2_Account_APIKeyInfo_XML).
* [Account Status XML](http://wiki.eve-id.net/APIv2_Account_AccountStatus_XML).

**v0.1.0**:

* [Server Status XML](http://wiki.eve-id.net/APIv2_Server_ServerStatus_XML).

## Implementation check list:

### Account

- [x] [Account Status XML](http://wiki.eve-id.net/APIv2_Account_AccountStatus_XML)
- [x] [API Key Info XML](http://wiki.eve-id.net/APIv2_Account_APIKeyInfo_XML)
- [x] [Characters (List of) XML](http://wiki.eve-id.net/APIv2_Account_Characters_XML)

----

### Api

- [ ] [Call List (Access Mask reference) XML](http://wiki.eve-id.net/APIv2_API_CallList_XML)

----

### Character

- [x] [Account Balance XML](http://wiki.eve-id.net/APIv2_Char_AccountBalance_XML)
- [ ] [Asset List XML](http://wiki.eve-id.net/APIv2_Char_AssetList_XML)
- [ ] [Calendar Event Attendees XML](http://wiki.eve-id.net/APIv2_Char_CalendarEventAttendees_XML)
- [ ] [Character Sheet XML](http://wiki.eve-id.net/APIv2_Char_CharacterSheet_XML)
- [ ] [Contact List XML](http://wiki.eve-id.net/APIv2_Char_ContactList_XML)
- [ ] [Contact Notifications XML](http://wiki.eve-id.net/APIv2_Char_ContactNotifications_XML)
- [ ] [Contracts XML](http://wiki.eve-id.net/APIv2_Char_Contracts_XML)
- [ ] [ContractItems XML](http://wiki.eve-id.net/APIv2_Char_ContractItems_XML)
- [ ] [ContractBids XML](http://wiki.eve-id.net/APIv2_Char_ContractBids_XML)
- [ ] [Factional Warfare Stats XML](http://wiki.eve-id.net/APIv2_Char_Factional_Warfare_Stats_XML)
- [ ] [Industry Jobs XML](http://wiki.eve-id.net/APIv2_Char_IndustryJobs_XML)
- [ ] [Kill Log (Kill Mails) XML](http://wiki.eve-id.net/APIv2_Char_KillLog_XML)
- [ ] [Locations XML](http://wiki.eve-id.net/APIv2_Char_Locations_XML)
- [ ] [Mail Bodies XML](http://wiki.eve-id.net/APIv2_Char_MailBodies_XML)
- [ ] [Mailing Lists XML](http://wiki.eve-id.net/APIv2_Char_mailinglists_XML)
- [ ] [Mail Messages (Headers) XML](http://wiki.eve-id.net/APIv2_Char_MailMessages_XML)
- [ ] [Market Orders XML](http://wiki.eve-id.net/APIv2_Char_MarketOrders_XML)
- [ ] [Medals XML](http://wiki.eve-id.net/APIv2_Char_Medals_XML)
- [ ] [Notifications XML](http://wiki.eve-id.net/APIv2_Char_Notifications_XML)
- [ ] [NotificationTexts XML](http://wiki.eve-id.net/APIv2_Char_NotificationTexts_XML)
- [ ] [Research XML](http://wiki.eve-id.net/APIv2_Char_Research_XML)
- [ ] [Skill in Training XML](http://wiki.eve-id.net/APIv2_Char_SkillInTraining_XML)
- [ ] [Skill Queue XML](http://wiki.eve-id.net/APIv2_Char_SkillQueue_XML)
- [ ] [Standings (NPC) XML](http://wiki.eve-id.net/APIv2_Char_Standings_XML)
- [ ] [Upcoming Calendar Events XML](http://wiki.eve-id.net/APIv2Char_UpcomingCalendarEvents_XML)
- [ ] [Wallet Journal XML](http://wiki.eve-id.net/APIv2_Char_JournalEntries_XML)
- [ ] [Wallet Transactions XML](http://wiki.eve-id.net/APIv2_Char_MarketTransactions_XML)

----

### Corporation

- [ ] [Account Balance XML](http://wiki.eve-id.net/APIv2_Corp_AccountBalance_XML)
- [ ] [Asset List XML](http://wiki.eve-id.net/APIv2_Corp_AssetList_XML)
- [ ] [Contact List XML](http://wiki.eve-id.net/APIv2_Corp_ContactList_XML)
- [ ] [Container Log XML](http://wiki.eve-id.net/APIv2_Corp_ContainerLog_XML)
- [ ] [Contracts XML](http://wiki.eve-id.net/APIv3_Corp_Contracts_XML)
- [ ] [ContractItems XML](http://wiki.eve-id.net/APIv2_Corp_ContractItems_XML)
- [ ] [ContractBids XML](http://wiki.eve-id.net/APIv2_Char_ContractBids_XML)
- [ ] [Corporation Sheet XML](http://wiki.eve-id.net/APIv2_Corp_CorporationSheet_XML)
- [ ] [Factional Warfare Stats XML](http://wiki.eve-id.net/APIv2_Corp_Factional_Warfare_Stats_XML)
- [ ] [Industry Jobs XML](http://wiki.eve-id.net/APIv2_Corp_IndustryJobs_XML)
- [ ] [Kill Log (Kill Mails) XML](http://wiki.eve-id.net/APIv2_Corp_KillLog_XML)
- [ ] [Locations XML](http://wiki.eve-id.net/APIv2_Corp_Locations_XML)
- [ ] [Market Orders XML](http://wiki.eve-id.net/APIv2_Corp_MarketOrders_XML)
- [ ] [Medals XML](http://wiki.eve-id.net/APIv2_Corp_Medals_XML)
- [ ] [Member Medals XML](http://wiki.eve-id.net/APIv2_Corp_MemberMedals_XML)
- [ ] [Member Security XML](http://wiki.eve-id.net/APIv2_Corp_MemberSecurity_XML)
- [ ] [Member Security Log XML](http://wiki.eve-id.net/APIv2_Corp_MemberSecurityLog_XML)
- [ ] [Member Tracking XML](http://wiki.eve-id.net/APIv2_Corp_MemberTracking_XML)
- [ ] [Outpost List XML](http://wiki.eve-id.net/APIv2_Corp_OutpostList_XML)
- [ ] [Outpost Service Detail XML](http://wiki.eve-id.net/APIv2_Corp_OutpostServiceDetail_XML)
- [ ] [Shareholders XML](http://wiki.eve-id.net/APIv2_Corp_Shareholders_XML)
- [ ] [Standings (NPC) XML](http://wiki.eve-id.net/APIv2_Corp_Standings_XML)
- [ ] [StarbaseDetail Details (POS) XML](http://wiki.eve-id.net/APIv2_Corp_StarbaseDetail_XML)
- [ ] [Starbase List (POS) XML](http://wiki.eve-id.net/APIv2_Corp_StarbaseList_XML)
- [ ] [Titles XML](http://wiki.eve-id.net/APIv2_Corp_CorporationTitles_XML)
- [ ] [Wallet Journal XML](http://wiki.eve-id.net/APIv2_Corp_JournalEntries_XML)
- [ ] [Wallet Transactions XML](http://wiki.eve-id.net/APIv2_Corp_MarketTransactions_XML)

----

### Eve

- [ ] [Alliance List XML](http://wiki.eve-id.net/APIv2_Eve_AllianceList_XML)
- [ ] [Certificate Tree XML](http://wiki.eve-id.net/APIv2_Certificate_Tree_XML)
- [ ] [Character Affiliation XML](http://wiki.eve-id.net/APIv2_Page_Index?title=APIv2_Eve_CharacterAffiliation_XML&action=edit&redlink=1)
- [ ] [Character ID (Name to ID Conversion) XML](http://wiki.eve-id.net/APIv2_Eve_CharacterID_XML)
- [ ] [Character Info XML](http://wiki.eve-id.net/APIv2_Eve_CharacterInfo_XML)
- [ ] [Character Name (ID to Name Conversion) XML](http://wiki.eve-id.net/APIv2_Eve_CharacterName_XML)
- [ ] [Conquerable Station List (Includes Outposts) XML](http://wiki.eve-id.net/APIv2_Eve_ConquerableStationList_XML)
- [ ] [Error List XML](http://wiki.eve-id.net/APIv2_Eve_ErrorList_XML)
- [ ] [Factional Warfare Stats XML](http://wiki.eve-id.net/APIv2_Factional_Warfare_Stats_XML)
- [ ] [Factional Warfare Top100 Stats XML](http://wiki.eve-id.net/APIv2_Factional_Warfare_Top100_Stats_XML)
- [ ] [RefTypes List XML](http://wiki.eve-id.net/APIv2_Eve_RefTypes_XML)
- [ ] [Skill Tree XML](http://wiki.eve-id.net/APIv2_Eve_SkillTree_XML)
- [ ] [Type Name XML](http://wiki.eve-id.net/APIv2_Eve_TypeName_XML)

----

### Map

- [ ] [Factional Warfare Systems (Occupancy Map) XML](http://wiki.eve-id.net/APIv2_Factional_Warfare_Occupancy_XML)
- [ ] [Jumps XML](http://wiki.eve-id.net/APIv2_Map_Jumps_XML)
- [ ] [Kills XML](http://wiki.eve-id.net/APIv2_Map_Kills_XML)
- [ ] [Sovereignty XML](http://wiki.eve-id.net/APIv2_Map_Sovereignty_XML)
- [ ] [Sovereignty Status (API disabled) XML](http://wiki.eve-id.net/APIv2_Map_Sovereignty_Status_XML)

----

### Misc

- [ ] [Image (ID to Character Portrait and Corporation/Alliance Logo)](http://wiki.eve-id.net/APIv2_Eve_Image_Service)
- [ ] [Old Portraits](http://wiki.eve-id.net/APIv2_Old_Portraits)

----

### Server

- [x] [Server Status XML](http://wiki.eve-id.net/APIv2_Server_ServerStatus_XML)

----


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/biow0lf/eve_online/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

