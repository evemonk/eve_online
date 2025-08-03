# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class Route < Base
      extend Forwardable

      API_PATH = "/v2/route/%<origin>s/%<destination>s"

      ALLOWED_FLAGS = %w[ shortest secure insecure ]

      CONNECTIONS_ERR_MSG = "connections must be an array, each connection pair must be an array of length 2"
      FLAG_ERR_MSG = "flag must be one of #{ALLOWED_FLAGS.join(", ")}"

      attr_reader :route, :origin, :destination, :avoid, :connections, :flag

      def initialize(options)
        super

        @destination = options.fetch(:destination)
        @origin = options.fetch(:origin)

        @flag = options.fetch(:flag, nil)
        raise(ArgumentError, FLAG_ERR_MSG) unless @flag.nil? || ALLOWED_FLAGS.include?(@flag)

        @avoid = options.fetch(:avoid, [])&.join(",")

        connections = []
        options.fetch(:connections, [])&.each do |conn|
          raise(ArgumentError, CONNECTIONS_ERR_MSG) unless conn.is_a?(Array) && conn.length == 2
          connections << conn.join("|")
        end
        @connections = connections.join(",")
      end

      def route
        response
      end

      def scope
      end

      def additional_query_params
        [:avoid, :connections, :flag]
      end

      def path
        format(API_PATH, origin:, destination:)
      end
    end
  end
end
