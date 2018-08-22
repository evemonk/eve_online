# frozen_string_literal: true

require 'json'
require 'memoist'
require 'active_support/time'
require 'faraday'

module EveOnline
  module ESI
    class Base
      extend Memoist

      attr_reader :token, :parser, :_read_timeout, :_open_timeout, :datasource

      def initialize(options = {})
        @token = options[:token]
        @parser = JSON
        @_read_timeout = options[:read_timeout] || 60
        @_open_timeout = options[:open_timeout] || 60
        @datasource = options[:datasource] || 'tranquility'
      end

      def url
        raise NotImplementedError
      end

      def scope
        raise NotImplementedError
      end

      def user_agent
        "EveOnline API (https://github.com/biow0lf/eve_online) v#{ VERSION }"
      end

      def read_timeout
        client.options.timeout
      end

      def read_timeout=(value)
        client.options.timeout = value
      end

      def open_timeout
        client.options.open_timeout
      end

      def open_timeout=(value)
        client.options.open_timeout = value
      end

      def client
        @client ||= begin
          faraday = Faraday.new

          faraday.headers[:user_agent] = user_agent
          faraday.authorization(:Bearer, token) if token
          faraday.options.timeout = _read_timeout
          faraday.options.open_timeout = _open_timeout
          faraday
        end
      end

      def resource
        @resource ||= client.get(url)
      end

      def content
        case resource.status
        when 200
          resource.body
        when 201
          # TODO: write
          raise NotImplementedError
        when 204
          # TODO: write
          # raise NotImplementedError
          raise EveOnline::Exceptions::NoContent
        when 304
          # TODO: write
          raise NotImplementedError
        when 400
          raise EveOnline::Exceptions::BadRequest
        when 401
          raise EveOnline::Exceptions::Unauthorized
        when 403
          raise EveOnline::Exceptions::Forbidden
        when 404
          raise EveOnline::Exceptions::ResourceNotFound
        when 500
          raise EveOnline::Exceptions::InternalServerError
        when 502
          raise EveOnline::Exceptions::BadGateway
        when 503
          raise EveOnline::Exceptions::ServiceUnavailable
        else
          # raise EveOnline::Exceptions::UnknownStatus
          raise NotImplementedError
        end
      rescue Faraday::TimeoutError
        raise EveOnline::Exceptions::Timeout
      end
      memoize :content

      def response
        parser.parse(content)
      end
      memoize :response

      private

      def parse_datetime_with_timezone(value)
        ActiveSupport::TimeZone['UTC'].parse(value)
      end
    end
  end
end
