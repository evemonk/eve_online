# frozen_string_literal: true

require "faraday"
require "faraday-http-cache"

module EveOnline
  module ESI
    class Client
      BASE_URL = "https://esi.evetech.net/"

      attr_reader :token, :language, :tenant, :adapter, :cache, :cache_store,
        :timeout, :open_timeout, :read_timeout, :write_timeout

      # @param token [String] ESI token. Default: `nil`.
      # @param language [String] The language to use for the response. One of: "en", "de", "fr", "ja", "zh", "ko", "es". Default: "en".
      # @param tenant [String] The tenant ID for the request. Default: "tranquility".
      # @param adapter [Symbol] Default: `Faraday.default_adapter`
      # @param cache [Boolean] Use `faraday-http-cache` for cache? Default: `false`.
      # @param cache_store [ActiveSupport::Cache] Rails.cache store. Default: `nil`.
      # @param timeout [Integer | Float] The max number of seconds to wait for the request to complete. Default: `30`.
      # @param open_timeout [Integer | Float] The max number of seconds to wait for the connection to be established. Default: `30`.
      # @param read_timeout [Integer | Float] The max number of seconds to wait for one block to be read. Default: `30`.
      # @param write_timeout [Integer | Float] The max number of seconds to wait for one block to be written. Default: `30`.
      def initialize(token: nil, language: "en", tenant: "tranquility",
        adapter: Faraday.default_adapter,
        cache: false, cache_store: nil,
        timeout: 30, open_timeout: 30, read_timeout: 30, write_timeout: 30)
        @token = token
        @language = language
        @tenant = tenant
        @adapter = adapter
        @cache = cache
        @cache_store = cache_store
        @middlewares = []
        @timeout = timeout
        @open_timeout = open_timeout
        @read_timeout = read_timeout
        @write_timeout = write_timeout
      end

      # Sorted as APIs in openapi docs

      # Alliance APIs
      def alliances
        Resources::AlliancesResources.new(self)
      end

      # Assets APIs
      def assets
        Resources::AssetsResources.new(self)
      end

      # Calendar APIs
      def calendar
        Resources::CalendarsResources.new(self)
      end

      # Character APIs
      def characters
        Resources::CharactersResources.new(self)
      end

      # Clones APIs
      def clones
        Resources::ClonesResources.new(self)
      end

      # Contacts APIs
      def contacts
        raise NotImplementedError, "Contacts API is not implemented yet"
      end

      # Contracts APIs
      def contracts
        raise NotImplementedError, "Contracts API is not implemented yet"
      end

      # Corporation APIs
      def corporations
        Resources::CorporationsResources.new(self)
      end

      # Corporation Projects APIs
      def corporation_projects
        raise NotImplementedError, "Corporation Projects API is not implemented yet"
      end

      # Dogma APIs
      def dogma
        Resources::DogmaResources.new(self)
      end

      # Faction Warfare APIs
      def faction_warfare
        raise NotImplementedError, "Faction Warfare API is not implemented yet"
      end

      # Fittings APIs
      def fittings
        raise NotImplementedError, "Fittings API is not implemented yet"
      end

      # Fleets APIs
      def fleets
        raise NotImplementedError, "Fleets API is not implemented yet"
      end

      # Freelance Jobs APIs
      def freelance_jobs
        raise NotImplementedError, "Freelance Jobs API is not implemented yet"
      end

      # Incursions APIs
      def incursions
        raise NotImplementedError, "Incursions API is not implemented yet"
      end

      # Industry APIs
      def industry
        raise NotImplementedError, "Industry API is not implemented yet"
      end

      # Insurance APIs
      def insurance
        raise NotImplementedError, "Insurance API is not implemented yet"
      end

      # Killmails APIs
      def killmails
        raise NotImplementedError, "Killmails API is not implemented yet"
      end

      # Location APIs
      def locations
        Resources::LocationResources.new(self)
      end

      # Loyalty APIs
      def loyalty
        Resources::LoyaltyPointsResources.new(self)
      end

      # Mail APIs
      def mail
        raise NotImplementedError, "Mail API is not implemented yet"
      end

      # Market APIs
      def market
        raise NotImplementedError, "Market API is not implemented yet"
      end

      # Meta APIs
      def meta
        raise NotImplementedError, "Meta API is not implemented yet"
      end

      # Planetary Interaction APIs
      def planetary_interaction
        raise NotImplementedError, "Planetary Interaction API is not implemented yet"
      end

      # Routes APIs
      def routes
        Resources::RoutesResources.new(self)
      end

      # Search APIs
      def search
        Resources::SearchResources.new(self)
      end

      # Skills APIs
      def skills
        Resources::SkillsResources.new(self)
      end

      # Sovereignty APIs
      def sovereignty
        raise NotImplementedError, "Sovereignty API is not implemented yet"
      end

      # Status API
      def server_status
        Resources::ServerStatusResources.new(self)
      end

      # Universe
      def universe
        Resources::UniverseResources.new(self)
      end

      # User Interface APIs
      def user_interface
        raise NotImplementedError, "User Interface API is not implemented yet"
      end

      # Wallet APIs
      def wallet
        Resources::WalletResources.new(self)
      end

      # Wars APIs
      def wars
        Resources::WarsResources.new(self)
      end

      def add_middleware(middleware)
        @middlewares << middleware
      end

      def connection
        @connection ||= Faraday.new(BASE_URL) do |c|
          if token
            c.request :authorization, "Bearer", token
          end

          if cache
            c.use :http_cache,
              store: cache_store,
              strategy: Faraday::HttpCache::Strategies::ByUrl,
              serializer: Marshal
          end

          c.options.timeout = timeout if timeout
          c.options.open_timeout = open_timeout if open_timeout
          c.options.read_timeout = read_timeout if read_timeout
          c.options.write_timeout = write_timeout if write_timeout

          c.request :json

          c.response :esi_raise_errors
          c.response :esi_parse_eve_dates
          c.response :json, content_type: "application/json"

          c.adapter adapter
        end
      end
    end
  end
end
