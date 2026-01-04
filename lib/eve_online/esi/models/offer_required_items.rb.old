# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class OfferRequiredItems < Base
        def offer_required_items
          output = []

          return output unless options.is_a?(Array)

          options.each do |offer_required_item|
            output << OfferRequiredItem.new(offer_required_item)
          end

          output
        end
      end
    end
  end
end
