# frozen_string_literal: true

module EveOnline
  module ESI
    module ParsedHeaders
      def etag
        headers["etag"]
      end

      def request_id
        headers["x-esi-request-id"]
      end

      def cache_status
        headers["x-esi-cache-status"]
      end

      def ratelimit_group
        headers["x-ratelimit-group"]
      end

      def ratelimit_limit
        headers["x-ratelimit-limit"]
      end

      def ratelimit_remaining
        headers["x-ratelimit-remaining"]&.to_i
      end

      def ratelimit_used
        headers["x-ratelimit-used"]&.to_i
      end

      def error_limit_remain
        headers["x-esi-error-limit-remain"]&.to_i
      end

      def error_limit_reset
        headers["x-esi-error-limit-reset"]&.to_i
      end
    end
  end
end
