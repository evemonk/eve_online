# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class CosmeticsResources < Resource
        # @param id [String] SKINR identifier
        def skinr(id:)
          response = get_request("cosmetics/skinr/#{id}")

          Models::CosmeticSkinr.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end
