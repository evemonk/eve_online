## Changelog

**master**
* Add `EveOnline::ESI::CorporationBlueprints`
* Add `EveOnline::ESI::Models::MarketHistory`
* Add `EveOnline::ESI::MarketHistory`

**v0.13.0**

* Drop CREST API support
* Drop `EveOnline::BaseCREST` without alternative
* Drop `EveOnline::Sovereignty::Campaigns` without alternative
* Drop Ruby 1.9.3 support
* Drop Ruby 2.0 support
* Drop Ruby 2.1 support
* Add `EveOnline::ESI::CharacterWallet`
* Add `EveOnline::SDE::Models::ChrRace#icon_id`
* Add `icon_id` to `EveOnline::SDE::Models::ChrRace#as_json`
* Rename `EveOnline::SDE::ChrRaces` to `EveOnline::SDE::Races`
* Rename `EveOnline::SDE::ChrRace` to `EveOnline::SDE::ChrRace`
* Rename `EveOnline::SDE::Races#chr_races` to `EveOnline::SDE::Races#races`
* Combine options to options hash for ESI
* Always use versioned ESI routes
* Drop `EveOnline::XML::ServerStatus`. Use `EveOnline::ESI::ServerStatus` instead.
* Add `EveOnline::ESI::CharacterAssets`
* Add `EveOnline::ESI::Models::Asset`
* Drop `EveOnline::Item`
* Drop `EveOnline::XML::CharacterAssetList`. Use `EveOnline::ESI::CharacterAssets` instead.
* Drop `EveOnline::XML::CharacterSkillQueue`. Use `EveOnline::ESI::CharacterSkillQueue` instead.
* Drop `EveOnline::XML::Models::SkillQueueEntry`
* Add `EveOnline::ESI::CharacterAttributes`
* Add `EveOnline::ESI::Models::Attributes`
* Add `EveOnline::ESI::Models::Character`
* Add `EveOnline::ESI::Models::Base`
* Add `EveOnline::ESI::Races`
* Add `EveOnline::ESI::Models::Race`
* Add `EveOnline::ESI::Bloodlines`
* Add `EveOnline::ESI::Models::Bloodline`
* Drop `EveOnline::SDE::Races`. Use `EveOnline::ESI::Races` instead.
* Drop `EveOnline::SDE::Models::Race`
* Add `EveOnline::ESI::CharacterImplants`
* Drop `EveOnline::XML::CharacterAccountBalance`. Use `EveOnline::ESI::CharacterWallet` instead.
* Drop `EveOnline::XML::CharacterSheet#balance`. Use `EveOnline::ESI::CharacterWallet` instead.
* Drop `EveOnline::XML::CharacterSheet#implants`. Use `EveOnline::ESI::CharacterImplants` instead.
* Drop `EveOnline::Implant`
* Drop `EveOnline::CharacterImplants`
* Drop `EveOnline::XML::CharacterSheet#skills`. Use `EveOnline::ESI::CharacterSkills` instead.
* Drop `EveOnline::CharacterSkills`
* Drop `EveOnline::Skill`
* Drop `EveOnline::XML::CharacterSkillInTraining`. Use `EveOnline::ESI::CharacterSkillQueue` instead.
* Drop `EveOnline::XML::CharacterCalendarEventAttendees`
* Drop `EveOnline::XML::CharacterChatChannels`
* Drop `EveOnline::XML::CharacterContactList`
* Drop `EveOnline::XML::CharacterContractBids`
* Drop `EveOnline::XML::CharacterContractItems`
* Drop `EveOnline::XML::CharacterContracts`
* Drop `EveOnline::XML::CharacterWalletTransactions`
* Drop `EveOnline::XML::CharacterFacWarStats`
* Drop `EveOnline::XML::CharacterIndustryJobs`
* Drop `EveOnline::XML::CharacterIndustryJobsHistory`
* Drop `EveOnline::XML::CharacterKillMails`
* Drop `EveOnline::XML::CharacterLocations`
* Drop `EveOnline::XML::CharacterMailBodies`
* Drop `EveOnline::XML::CharacterMailingLists`
* Drop `EveOnline::XML::CharacterMailMessages`
* Drop `EveOnline::XML::CharacterMedals`
* Drop `EveOnline::XML::CharacterNotifications`
* Drop `EveOnline::XML::CharacterNotificationTexts`
* Drop `EveOnline::XML::CharacterPlanetaryColonies`
* Drop `EveOnline::XML::CharacterPlanetaryLinks`
* Drop `EveOnline::XML::CharacterPlanetaryPins`
* Drop `EveOnline::XML::CharacterPlanetaryRoutes`
* Drop `EveOnline::XML::CharacterResearch`
* Add `EveOnline::ESI::Alliance`
* Add `EveOnline::ESI::AllianceIcon`
* Add `EveOnline::ESI::Models::Alliance`
* Add `EveOnline::ESI::Models::AllianceIcon`
* Add `EveOnline::ESI::Models::CharacterPortrait`
* Add `EveOnline::ESI::CharacterBlueprints`
* Add `EveOnline::ESI::Models::Blueprint`
* Drop `EveOnline::XML::CharacterBlueprints`. Use `EveOnline::ESI::CharacterBlueprints` instead.
* Drop `EveOnline::Eve::CharacterID`
* Drop `EveOnline::XML::AccountCharacters`. ESI doesn't support this.
* Drop `EveOnline::XML::ApiKeyInfo`
* Drop `EveOnline::XML::AccountStatus`. ESO doesn't support this.
* Add `EveOnline::ESI::Models::Standing`
* Add `EveOnline::ESI::Standings`
* Drop `EveOnline::XML::CharacterStandings`. Use `EveOnline::ESI::Standings` instead.
* Add `EveOnline::ESI::CharacterFatigue`
* Add `EveOnline::ESI::Models::Fatigue`
* Add `EveOnline::ESI::Models::ServerStatus`
* Add `EveOnline::ESI::Corporation`. ([#120](https://github.com/biow0lf/eve_online/pull/120), @Mekaret)
* Add `EveOnline::ESI::CharacterClones`
* Add `EveOnline::ESI::Models::JumpClone`
* Add `EveOnline::ESI::Models::HomeLocation`
* Drop `EveOnline::JumpClone`
* Drop `EveOnline::JumpCloneImplant`
* Drop `EveOnline::CharacterJumpClones`
* Drop `EveOnline::CharacterJumpCloneImplants`
* Drop `EveOnline::XML::CharacterSheet#jump_clones`
* Drop `EveOnline::XML::CharacterSheet#jump_clone_implants`
* Drop `EveOnline::XML::CharacterSheet`. Use ESI endpoints.
* Add `EveOnline::ESI::CharacterIndustryJobs`. ([#126](https://github.com/biow0lf/eve_online/pull/126), @Mekaret)
* Add `EveOnline::ESI::CorporationIndustryJobs`. ([#126](https://github.com/biow0lf/eve_online/pull/126), @Mekaret)
* Drop `EveOnline::XML::Models::AccountTypeObject`
* Add `EveOnline::ESI::Factions`
* Add `EveOnline::ESI::Models::Faction`
* Add `EveOnline::ESI::DogmaAttributes`
* Add `EveOnline::ESI::Models::DogmaAttribute`
* Add `EveOnline::ESI::DogmaAttribute`

**v0.12.0**

* **Breaking change**. Rename `EveOnline::Exceptions::Exception` to `EveOnline::Exceptions::Base`.
* Add `EveOnline::XML::Base` class
* Add `EveOnline::Exceptions::UnauthorizedException`
* Add `EveOnline::Exceptions::InvalidCharacterIDException`
* Test with Rails 5.1.0 too
* Rename `EveOnline::Account::Status` to `EveOnline::XML::AccountStatus`
* Rename `EveOnline::Account::ApiKeyInfo` to `EveOnline::XML::ApiKeyInfo`
* Rename `EveOnline::Account::Characters` to `EveOnline::XML::AccountCharacters`
* Rename `EveOnline::Characters::AccountBalance` to `EveOnline::XML::CharacterAccountBalance`
* Rename `EveOnline::Characters::AssetList` to `EveOnline::XML::CharacterAssetList`
* Rename `EveOnline::Characters::Blueprints` to `EveOnline::XML::CharacterBlueprints`
* Rename `EveOnline::Characters::Bookmarks` to `EveOnline::XML::CharacterBookmarks`
* Rename `EveOnline::Characters::CharacterSheet` to `EveOnline::XML::CharacterSheet`
* Rename `EveOnline::Corporations::MarketOrders` to `EveOnline::XML::CorporationMarketOrders`
* Rename `EveOnline::Server::Status` to `EveOnline::XML::ServerStatus`
* Rename `EveOnline::Characters::Medals` to `EveOnline::XML::CharacterMedals`
* Rename `EveOnline::Characters::SkillQueue` to `EveOnline::XML::CharacterSkillQueue`
* Rename `EveOnline::Characters::ChatChannels` to `EveOnline::XML::CharacterChatChannels`
* Rename `EveOnline::Characters::CalendarEventAttendees` to `EveOnline::XML::CharacterCalendarEventAttendees`
* Rename `EveOnline::Characters::ContractBids` to `EveOnline::XML::CharacterContractBids`
* Rename `EveOnline::Characters::ContractItems` to `EveOnline::XML::CharacterContractItems`
* Rename `EveOnline::Characters::ContactList` to `EveOnline::XML::CharacterContactList`
* Rename `EveOnline::Characters::ContactNotifications` to `EveOnline::XML::CharacterContactNotifications`
* Rename `EveOnline::Characters::Contracts` to `EveOnline::XML::CharacterContracts`
* Rename `EveOnline::Characters::FacWarStats` to `EveOnline::XML::CharacterFacWarStats`
* Rename `EveOnline::Characters::IndustryJobsHistory` to `EveOnline::XML::CharacterIndustryJobsHistory`
* Rename `EveOnline::Characters::IndustryJobs` to `EveOnline::XML::CharacterIndustryJobs`
* Rename `EveOnline::Characters::KillMails` to `EveOnline::XML::CharacterKillMails`
* Rename `EveOnline::Characters::Locations` to `EveOnline::XML::CharacterLocations`
* Rename `EveOnline::Characters::MailBodies` to `EveOnline::XML::CharacterMailBodies`
* Rename `EveOnline::Characters::MailMessages` to `EveOnline::XML::CharacterMailMessages`
* Rename `EveOnline::Characters::MailingLists` to `EveOnline::XML::CharacterMailingLists`
* Rename `EveOnline::Characters::MarketOrders` to `EveOnline::XML::CharacterMarketOrders`
* Rename `EveOnline::Characters::NotificationTexts` to `EveOnline::XML::CharacterNotificationTexts`
* Rename `EveOnline::Characters::Notifications` to `EveOnline::XML::CharacterNotifications`
* Rename `EveOnline::Characters::PlanetaryColonies` to `EveOnline::XML::CharacterPlanetaryColonies`
* Rename `EveOnline::Characters::PlanetaryLinks` to `EveOnline::XML::CharacterPlanetaryLinks`
* Rename `EveOnline::Characters::PlanetaryPins` to `EveOnline::XML::CharacterPlanetaryPins`
* Rename `EveOnline::Characters::PlanetaryRoutes` to `EveOnline::XML::CharacterPlanetaryRoutes`
* Rename `EveOnline::Characters::Research` to `EveOnline::XML::CharacterResearch`
* Rename `EveOnline::Characters::SkillInTraining` to `EveOnline::XML::CharacterSkillInTraining`
* Rename `EveOnline::Characters::Standings` to `EveOnline::XML::CharacterStandings`
* Rename `EveOnline::Characters::UpcomingCalendarEvents` to `EveOnline::XML::CharacterUpcomingCalendarEvents`
* Rename `EveOnline::Characters::WalletJournal` to `EveOnline::XML::CharacterWalletJournal`
* Rename `EveOnline::Characters::WalletTransactions` to `EveOnline::XML::CharacterWalletTransactions`
* Rename `EveOnline::XML::CharacterSheet#base_intelligence` to `EveOnline::XML::CharacterSheet#intelligence`
* Rename `EveOnline::XML::CharacterSheet#base_memory` to `EveOnline::XML::CharacterSheet#memory`
* Rename `EveOnline::XML::CharacterSheet#base_charisma` to `EveOnline::XML::CharacterSheet#charisma`
* Rename `EveOnline::XML::CharacterSheet#base_perception` to `EveOnline::XML::CharacterSheet#perception`
* Rename `EveOnline::XML::CharacterSheet#base_willpower` to `EveOnline::XML::CharacterSheet#willpower`
* Fix `EveOnline::ESI::Character`
* Use versioned API endpoints
* Ignore missed fields in responses
* Add `EveOnline::ESI::ServerStatus`

**v0.11.0**

* Add SDE support classes
* `EveOnline::SDE::AgtAgentTypes`
* `EveOnline::SDE::AgtAgents`
* `EveOnline::SDE::AgtResearchAgents`
* `EveOnline::SDE::ChrRaces`
* `EveOnline::SDE::InvFlags`
* `EveOnline::SDE::InvItems`
* `EveOnline::SDE::InvNames`
* `EveOnline::SDE::InvPositions`
* `EveOnline::SDE::Models::AgtAgentType`
* `EveOnline::SDE::Models::AgtAgent`
* `EveOnline::SDE::Models::AgtResearchAgent`
* `EveOnline::SDE::Models::ChrRace`
* `EveOnline::SDE::Models::InvFlag`
* `EveOnline::SDE::Models::InvItem`
* `EveOnline::SDE::Models::InvName`
* `EveOnline::SDE::Models::InvPosition`
* Finish `EveOnline::ESI::Characters::Character`
* Add `EveOnline::ESI::CharacterPortrait`
* Add `EveOnline::ESI::CharacterSkills`
* Rename `EveOnline::ESI::Characters::Character` to `EveOnline::ESI::Character`
* Add `EveOnline::ESI::CharacterSkillQueue`
* Add `EveOnline::ESI::CharacterLoyaltyPoints`
* Add `EveOnline::ESI::Models::LoyaltyPoint` class for handling character loyalty points
* Add `EveOnline::ESI::Models::SkillQueue` class for handling character skill queue entries
* Add `EveOnline::ESI::Models::Skill` class for handing character skills
* Rename `EveOnline::SkillQueueEntry` to `EveOnline::XML::Models::SkillQueueEntry`

**v0.10.0**

* Replace `open-uri` with `faraday`
* Add `EveOnline::ESI::Characters::Character`
* Add `EveOnline::AccountTypeObject` class for handling EveOnline account type values
* `EveOnline::Account::ApiKeyInfo#type` now returns symbols. e.g. `:account`
* Add `EveOnline::Account::ApiKeyInfo#as_json`
* Rename `EveOnline::Account::ApiKeyInfo#type` to `#api_key_type`

**v0.9.0**

* Add basic `EveOnline::Characters::Contracts`
* Add basic `EveOnline::Characters::ContractBids`
* Add basic `EveOnline::Characters::ContractItems`
* Add basic `EveOnline::Characters::FacWarStats`
* Add basic `EveOnline::Characters::IndustryJobs`
* Add basic `EveOnline::Characters::IndustryJobsHistory`
* Add `EveOnline::JumpCloneImplant` class for handling character jump clone implant
* Add `EveOnline::CharacterJumpCloneImplants` class for handling character jump clone implants
* Add basic `EveOnline::Characters::KillMails`
* Add basic `EveOnline::Characters::Locations`
* Add basic `EveOnline::Characters::MailBodies`
* Add basic `EveOnline::Characters::MailingLists`
* Add basic `EveOnline::Characters::MailMessages`
* Add basic `EveOnline::Characters::MarketOrders`
* Add basic `EveOnline::Characters::Notifications`
* `EveOnline::Characters::AccountBalance#balance` return float from now
* `EveOnline::Characters::CharacterSheet#balance` return float from now
* Add basic `EveOnline::Characters::NotificationTexts`
* Add basic `EveOnline::Characters::PlanetaryColonies`
* Add basic `EveOnline::Characters::PlanetaryLinks`
* Add basic `EveOnline::Characters::PlanetaryPins`
* Add basic `EveOnline::Characters::PlanetaryRoutes`
* Add basic `EveOnline::Characters::Research`
* Add basic `EveOnline::Characters::WalletJournal`
* Add basic `EveOnline::Characters::WalletTransactions`
* Add `EveOnline::SkillQueueEntry` class for handling character skill queue entry
* Make `EveOnline::Characters::Blueprints#row` `private`
* Make `EveOnline::Characters::Blueprints#rowset` `private`
* Make `EveOnline::Account::ApiKeyInfo#row` `private`
* Make `EveOnline::Account::ApiKeyInfo#rowset` `private`
* Make `EveOnline::Account::Characters#row` `private`
* Make `EveOnline::Account::Characters#rowset` `private`
* [Skill Queue](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_skillqueue.html)
* Add `EveOnline::ContactNotification` class for handling character contact notification
* [Contact Notifications](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contactnotifications.html)
* Make `EveOnline::Characters::AccountBalance#row` `private`
* Make `EveOnline::Characters::AccountBalance#rowset` `private`
* Make `EveOnline::Characters::Account#key` `private`
* Make `EveOnline::Characters::AssetList#row` `private`
* Make `EveOnline::Characters::AssetList#rowset` `private`
* Make `EveOnline::Characters::Locations#escaped_ids` `private`
* Make `EveOnline::Characters::MailBodies#escaped_ids` `private`
* Make `EveOnline::Characters::NotificationTexts#escaped_ids` `private`
* Make `EveOnline::Characters::UpcomingCalendarEvents#row` `private`
* Make `EveOnline::Characters::UpcomingCalendarEvents#rowset` `private`
* Add access masks
* Make `EveOnline::Characters::Bookmarks#row` `private`
* Make `EveOnline::Characters::Bookmarks#rowset` `private`
* Add `EveOnline::WalletJournalEntry` class for handling character wallet journal entry
* [Wallet Journal](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html)
* Rework memoization
* [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_marketorders.html)
* [Market Orders](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/corporation/corp_marketorders.html)

**v0.8.0**

* Add basic `EveOnline::Characters::Medals` class
* Add basic `EveOnline::Characters::CharacterSheet` class
* Add `EveOnline::Implant` class for handling character implant
* Add `EveOnline::Skill` class for handling character skill
* Add `EveOnline::CharacterSkills` class for handling character skills
* Add `EveOnline::JumpClone` class for handling character jump clone
* Add `EveOnline::CharacterImplants` class for handling character implants
* Add `EveOnline::CharacterJumpClones` class for handling character jump clones
* Finish [Character Bookmarks](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_bookmarks.html)
* Finish [Standings](https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_standings.html)
* Add `EveOnline::Standing` class for handling character standing

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
