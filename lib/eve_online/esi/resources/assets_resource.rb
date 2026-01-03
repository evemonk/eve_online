# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class AssetsResource < Resource
        # @param id [Integer] The ID of the character.
        # @param page [Integer] Page ID. Default: `1`.
        def character(id:, page: 1)
          response = get_request("characters/#{id}/assets", params: {page: page})

          Collection.from_response(response, type: Models::CharacterAsset)
        end
      end
    end
  end
end
