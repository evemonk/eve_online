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

        def effects
          response = get_request("dogma/effects")

          Models::DogmaEffects.new(body: response.body, headers: response.headers)
        end

        # @param id [Integer] Effect ID
        def effect(id:)
          response = get_request("dogma/effects/#{id}")

          Models::DogmaEffect.new(attributes: response.body, headers: response.headers)
        end

        # @param type_id [Integer] The type ID of the dynamic item
        # @param item_id [Integer] The item ID of the dynamic item
        def dynamic_item(type_id:, item_id:)
          response = get_request("dogma/dynamic/items/#{type_id}/#{item_id}")

          Models::DogmaDynamicItem.new(attributes: response.body, headers: response.headers)
        end

        private

        def compatibility_date
          "2026-08-18"
        end
      end
    end
  end
end
