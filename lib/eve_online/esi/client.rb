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
        Resources::AlliancesResource.new(self)
      end

      # Assets APIs
      def assets
        Resources::AssetsResource.new(self)
      end

      # Calendar APIs
      def calendar
      end

      # Character APIs
      def characters
        Resources::CharactersResource.new(self)
      end

      # Clones APIs

      # Contacts APIs

      # Contracts APIs

      # Corporation APIs
      def corporations
        Resources::CorporationsResource.new(self)
      end

      # Routes APIs
      def routes
        Resources::RoutesResources.new(self)
      end

      # Status API
      def server_status
        Resources::ServerStatusResource.new(self)
      end

      # Universe
      def universe
        Resources::UniverseResource.new(self)
      end

      # Wallet APIs
      def wallet
        Resources::WalletResources.new(self)
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
