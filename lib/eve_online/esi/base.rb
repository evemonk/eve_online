# frozen_string_literal: true

require 'net/http'
require 'openssl'
require 'json'
require 'active_support/time'

module EveOnline
  module ESI
    class Base
      attr_reader :token, :parser, :_read_timeout, :_open_timeout, :etag,
                  :datasource, :language

      def initialize(options = {})
        @token = options.fetch(:token, nil)
        @parser = options.fetch(:parser, JSON)
        @_read_timeout = options.fetch(:read_timeout, 60)
        @_open_timeout = options.fetch(:open_timeout, 60)
        @etag = options.fetch(:etag, nil)
        @datasource = options.fetch(:datasource, 'tranquility')
        @language = options.fetch(:language, 'en-us')
      end

      def url
        raise NotImplementedError
      end

      def scope
        raise NotImplementedError
      end

      def user_agent
        "EveOnline API (https://github.com/evemonk/eve_online) v#{ VERSION }"
      end

      def http_method
        'Get'
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

      def current_etag
        resource.header['Etag']&.gsub('W/', '')&.gsub('"', '')
      end

      def page; end

      def total_pages
        resource.header['X-Pages']&.to_i
      end

      def client
        @client ||= begin
          http = Net::HTTP.new(uri.host, uri.port)
          http.read_timeout = _read_timeout
          http.open_timeout = _open_timeout
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          # http.set_debug_output($stdout)
          http
        end
      end

      def request
        @request ||= begin
          request = "Net::HTTP::#{ http_method }".constantize.new(uri.request_uri)

          request['User-Agent'] = user_agent
          request['Accept'] = 'application/json'
          request['Accept-Language'] = language
          request['Authorization'] = "Bearer #{ token }" if token
          request['If-None-Match'] = etag if etag
          request['Content-Type'] = 'application/json' if http_method == 'Post'
          request.body = payload if http_method == 'Post'

          request
        end
      end

      def uri
        @uri ||= URI.parse(url)
      end

      def resource
        @resource ||= client.request(request)
      end

      def no_content?
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
          # TODO: write
          # raise NotImplementedError
          raise EveOnline::Exceptions::NoContent
        when Net::HTTPNotModified
          # TODO: write etag support
          raise NotImplementedError
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
      rescue Net::OpenTimeout, Net::ReadTimeout
        raise EveOnline::Exceptions::Timeout
      end

      def response
        @response ||= parser.parse(content)
      end

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone['UTC'].parse(value)
      end
    end
  end
end
