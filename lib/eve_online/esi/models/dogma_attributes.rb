# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class DogmaAttributes < Base
        def dogma_attributes
          output = []

          return output unless options.is_a?(Array)

          options.each do |dogma_attribute_short|
            output << DogmaAttributeShort.new(dogma_attribute_short)
          end

          output
        end
      end
    end
  end
end
