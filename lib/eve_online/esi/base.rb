# frozen_string_literal: true

require "net/http"
require "openssl"
require "json"
require "active_support/time"

module EveOnline
  module ESI
    class Base
      API_HOST = "esi.evetech.net"

      attr_reader :token, :parser, :_read_timeout, :_open_timeout, :_etag,
        :language

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        attr_reader :_write_timeout
      end

      def initialize(options = {})
        @token = options.fetch(:token, nil)
        @parser = options.fetch(:parser, JSON)
        @_read_timeout = options.fetch(:read_timeout, 60)
        @_open_timeout = options.fetch(:open_timeout, 60)
        if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
          @_write_timeout = options.fetch(:write_timeout, 60)
        end
        @_etag = options.fetch(:etag, nil)
        @language = options.fetch(:language, "en-us")
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
        "Get"
      end

      def read_timeout
        client.read_timeout
      end

      def read_timeout=(value)
        client.read_timeout = value
      end

      def open_timeout
        client.open_timeout
      end

      def open_timeout=(value)
        client.open_timeout = value
      end

      if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
        def write_timeout
          client.write_timeout
        end

        def write_timeout=(value)
          client.write_timeout = value
        end
      end

      def etag=(value)
        @_etag = value
      end

      def etag
        resource.header["Etag"]&.gsub("W/", "")&.gsub('"', "")
      end

      def page
      end

      def total_pages
        resource.header["X-Pages"]&.to_i
      end

      def client
        @client ||= begin
          http = Net::HTTP.new(uri.host, uri.port)
          http.read_timeout = _read_timeout
          http.open_timeout = _open_timeout
          if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.6.0")
            http.write_timeout = _write_timeout
          end
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          # http.set_debug_output($stdout)
          http
        end
      end

      def request
        @request ||= begin
          request = "Net::HTTP::#{http_method}".constantize.new(uri.request_uri)

          request["User-Agent"] = user_agent
          request["Accept"] = "application/json"
          request["Authorization"] = "Bearer #{token}" if token
          request["If-None-Match"] = _etag if _etag
          request["Content-Type"] = "application/json" if http_method == "Post"
          request.body = payload if http_method == "Post"

          request
        end
      end

      if Gem::Version.new(RUBY_VERSION) < Gem::Version.new("2.6.0")
        class Net::WriteTimeout < StandardError; end
      end

      def uri
        @uri ||= URI::HTTPS.build(host: API_HOST,
                                  path: path,
                                  query: query.to_query)
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

        hash.reject { |_, v| v.blank? }
      end

      def resource
        @resource ||= client.request(request)
      rescue Net::OpenTimeout, Net::ReadTimeout, Net::WriteTimeout
        raise EveOnline::Exceptions::Timeout
      end

      def not_modified?
        resource.is_a?(Net::HTTPNotModified)
      end

      def content
        case resource
        when Net::HTTPOK
          # TODO: memoize resource.body as @content
          resource.body
        when Net::HTTPCreated
          # TODO: write
          raise NotImplementedError
        when Net::HTTPNoContent
          raise EveOnline::Exceptions::NoContent
        when Net::HTTPNotModified
          raise EveOnline::Exceptions::NotModified
        when Net::HTTPBadRequest
          raise EveOnline::Exceptions::BadRequest
        when Net::HTTPUnauthorized
          raise EveOnline::Exceptions::Unauthorized
        when Net::HTTPForbidden
          raise EveOnline::Exceptions::Forbidden
        when Net::HTTPNotFound
          raise EveOnline::Exceptions::ResourceNotFound
        when Net::HTTPInternalServerError
          raise EveOnline::Exceptions::InternalServerError
        when Net::HTTPBadGateway
          raise EveOnline::Exceptions::BadGateway
        when Net::HTTPServiceUnavailable
          raise EveOnline::Exceptions::ServiceUnavailable
        else
          # raise EveOnline::Exceptions::UnknownStatus
          raise NotImplementedError
        end
      end

      def response
        @response ||= parser.parse(content)
      end

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone["UTC"].parse(value)
      end
    end
  end
end
