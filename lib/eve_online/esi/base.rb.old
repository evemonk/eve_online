# frozen_string_literal: true

require "faraday"
require "active_support/time"
require "active_support/core_ext/object/blank"

module EveOnline
  module ESI
    class Base
      API_HOST = "esi.evetech.net"

      attr_reader :token, :_read_timeout, :_open_timeout, :_write_timeout,
        :language, :adapter, :middlewares

      attr_writer :token

      def initialize(options = {})
        @token = options.fetch(:token, nil)
        @_read_timeout = options.fetch(:read_timeout, 60)
        @_open_timeout = options.fetch(:open_timeout, 60)
        @_write_timeout = options.fetch(:write_timeout, 60)
        @language = options.fetch(:language, "en-us")
        @adapter = options.fetch(:adapter, Faraday.default_adapter)
        @middlewares = options.fetch(:middlewares, [])
      end

      def url
        uri.to_s
      end

      def scope
        raise NotImplementedError
      end

      def user_agent
        "EveOnline API (https://github.com/evemonk/eve_online) v#{VERSION}"
      end

      def http_method
        :get
      end

      def read_timeout
        connection.options.read_timeout
      end

      def read_timeout=(value)
        connection.options.read_timeout = value
      end

      def open_timeout
        connection.options.open_timeout
      end

      def open_timeout=(value)
        connection.options.open_timeout = value
      end

      def write_timeout
        connection.options.write_timeout
      end

      def write_timeout=(value)
        connection.options.write_timeout = value
      end

      def page
      end

      def total_pages
        resource.headers["x-pages"]&.to_i
      end

      def error_limit_remain
        resource.headers["x-esi-error-limit-remain"]&.to_i
      end

      def error_limit_reset
        resource.headers["x-esi-error-limit-reset"]&.to_i
      end

      def request_id
        resource.headers["x-esi-request-id"]
      end

      def add_middleware(middleware)
        @middlewares << middleware
      end

      def connection
        @connection ||= Faraday.new do |f|
          f.headers["User-Agent"] = user_agent
          f.headers["Accept"] = "application/json"
          f.request :authorization, "Bearer", token if token
          f.options.read_timeout = _read_timeout
          f.options.open_timeout = _open_timeout
          f.options.write_timeout = _write_timeout
          f.use FaradayMiddlewares::RaiseErrors
          middlewares.each do |middleware|
            f.use middleware[:class], esi: self
          end
          f.response :json, content_type: "application/json"
          f.adapter adapter
        end
      end

      def uri
        @uri ||= begin
          params = {host: API_HOST, path: path}
          params[:query] = query.to_query if query.presence
          URI::HTTPS.build(params)
        end
      end

      def additional_query_params
        []
      end

      def base_query_params
        []
      end

      def path
        raise NotImplementedError
      end

      def query
        hash = {}

        (base_query_params + additional_query_params).each do |param|
          hash[param] = public_send(param)
        end

        hash.reject { |_, v| v.nil? || v == "" }
      end

      def resource
        @resource ||= connection.public_send(http_method, uri)
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError
        raise EveOnline::Exceptions::Timeout
      end

      def response
        @response ||= resource.body
      end

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone["UTC"].parse(value)
      end
    end
  end
end
