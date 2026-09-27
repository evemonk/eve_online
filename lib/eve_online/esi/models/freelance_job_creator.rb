# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobCreator < Object
        def character
          IdName.new(attributes: attributes.character) if attributes.character
        end

        def corporation
          IdName.new(attributes: attributes.corporation) if attributes.corporation
        end
      end
    end
  end
end
