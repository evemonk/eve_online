# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class AssetsResource < Resource
        # @param id [Integer] The ID of the character
        def character(id:)
          response = get_request("characters/#{id}/assets")

          Collection.from_response(response, type: Models::CharacterAsset)
        end
      end
    end
  end
end
