# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobAccessAndVisibility < Object
        def as_json
          {
            acl_protected: attributes.acl_protected
          }
        end

        def broadcast_locations
          Collection.from_array(attributes.broadcast_locations || [], type: IdName)
        end

        def restrictions
          FreelanceJobRestrictions.new(attributes: attributes.restrictions) if attributes.restrictions
        end
      end
    end
  end
end
