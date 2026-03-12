# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class DogmaResources < Resource
        def attributes
          response = get_request("dogma/attributes")

          Models::DogmaAttributes.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Attribute ID
        def attribute(id:)
          response = get_request("dogma/attributes/#{id}")

          Models::DogmaAttribute.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2025-12-16"
        end
      end
    end
  end
end
