# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class WalletResources < Resource
        # @param id [Integer] The ID of the character
        def character(id:)
          response = get_request("characters/#{id}/wallet")

          Models::CharacterWallet.new(body: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end
