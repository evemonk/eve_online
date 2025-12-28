# frozen_string_literal: true

require "faraday"

module EveOnline
  module ESI
    class Client
      BASE_URL = "https://esi.evetech.net/"

      attr_reader :language, :tenant, :adapter

      # @param language [String] The language to use for the response. One of: "en", "de", "fr", "ja", "zh", "ko", "es". Default: "en".
      # @param tenant [String] The tenant ID for the request. Default: "tranquility".
      # @param adapter [Symbol] Default: Faraday.default_adapter
      def initialize(language: "en", tenant: "tranquility", adapter: Faraday.default_adapter)
        @language = language
        @tenant = tenant
        @adapter = adapter
      end

      def server_status
        Resources::ServerStatusResource.new(self)
      end

      def connection
        @connection ||= Faraday.new(BASE_URL) do |c|
          c.request :json
          c.response :json, content_type: "application/json"
          c.adapter adapter
        end
      end
    end
  end
end
