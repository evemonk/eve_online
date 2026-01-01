# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Alliances < Object
        def alliance_ids
          body
        end
      end
    end
  end
end
