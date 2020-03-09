# frozen_string_literal: true

module EveOnline
  module ESI
    class Killmail < Base
      API_PATH = "/v1/killmails/%<killmail_id>s/%<killmail_hash>s/"

      attr_reader :killmail_id, :killmail_hash

      def initialize(options)
        super

        @killmail_id = options.fetch(:killmail_id)
        @killmail_hash = options.fetch(:killmail_hash)
      end

      # TODO: implement
      def as_json
        {}
      end

      def scope
      end

      def path
        format(API_PATH, killmail_id: killmail_id, killmail_hash: killmail_hash)
      end
    end
  end
end
