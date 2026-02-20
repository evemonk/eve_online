# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Wars < Object
        def war_ids
          body
        end
      end
    end
  end
end
