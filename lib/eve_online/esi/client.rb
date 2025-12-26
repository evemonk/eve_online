# frozen_string_literal: true

require "faraday"

module EveOnline
  module ESI
    class Client
      BASE_URL = "https://esi.evetech.net/"

      attr_reader :language, :tenant, :adapter

      def initialize(language: "en", tenant: "tranquility", adapter: Faraday.default_adapter)
        @language = language
        @tenant = tenant
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |c|
          c.url_prefix = BASE_URL
          c.request :json
          c.response :json, content_type: "application/json"
          c.adapter adapter
        end
      end
    end
  end
end
