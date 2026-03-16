# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class KillmailsResources < Resource
        # @param killmail_id [Integer] The killmail ID
        # @param killmail_hash [String] The killmail hash for verification
        def killmail(killmail_id:,killmail_hash:)
          response = get_request("killmails/#{killmail_id}/#{killmail_hash}")

          Models::Killmail.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end
