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

 * MRI 2.0
 * MRI 2.1
 * MRI 2.2

## Usage

Server status:

```ruby
status = EveOnline::Server::Status.new
status.as_json # => {:current_time=>"2015-11-20 22:18:59", :cached_until=>"2015-11-20 22:20:50", :server_open=>true, :online_players=>25192}

status.current_time # => "2015-11-20 22:18:59"
status.cached_until # => "2015-11-20 22:20:50"
status.server_open? # => true
status.online_players # => 25192
```

Account status:

```ruby
key_id = '1234567'
v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
account_status = EveOnline::Account::Status.new(key_id, v_code)
account_status.as_json
# => {:current_time=>"2015-11-20 23:02:48", :paid_until=>"2015-11-28 18:12:56", :create_date=>"2010-01-15 15:11:00", :logon_count=>388, :logon_minutes=>15598, :cached_until=>"2015-11-20 23:59:48"}

account_status.current_time # => "2015-11-20 23:02:48"
account_status.paid_until # => "2015-11-28 18:12:56"
account_status.create_date # => "2010-01-15 15:11:00"
account_status.logon_count # => 388
account_status.logon_minutes # => 15598
account_status.cached_until # => "2015-11-20 23:59:48"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Changelog

master: [Account Characters XML](http://wiki.eve-id.net/APIv2_Account_Characters_XML).

v0.2.0: [Character Account Balance XML](http://wiki.eve-id.net/APIv2_Char_AccountBalance_XML), [Account APIKeyInfo XML](http://wiki.eve-id.net/APIv2_Account_APIKeyInfo_XML), [Account Status XML](http://wiki.eve-id.net/APIv2_Account_AccountStatus_XML).

v0.1.0: [Server Status XML](http://wiki.eve-id.net/APIv2_Server_ServerStatus_XML).

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

