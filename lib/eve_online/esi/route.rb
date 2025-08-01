# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class Route < Base
      extend Forwardable

      API_PATH = "/v2/route/%<origin>s/%<destination>s"

      ALLOWED_FLAGS = %w[ shortest secure insecure ]

      attr_reader :route, :origin, :destination, :avoid, :connections, :flag

      def initialize(options)
        super

        @destination = options.fetch(:destination)
        @origin = options.fetch(:origin)
        @avoid = options.fetch(:avoid, []).join(",")
        @connections = options.fetch(:connections, []).join(",")
        @flag = options.fetch(:flag, nil)
        raise(ArgumentError) unless @flag.nil? || ALLOWED_FLAGS.include?(@flag)
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
