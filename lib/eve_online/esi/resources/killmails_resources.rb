# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class KillmailsResources < Resource
        # @param id [Integer] The killmail ID to be queried
        # @param hash [String] The killmail hash for verification
        def retrieve(id:, hash:)
          response = get_request("killmails/#{id}/#{hash}")

          Models::KillmailDetail.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end
