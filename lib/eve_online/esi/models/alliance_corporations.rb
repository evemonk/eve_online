# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class AllianceCorporations < Object
        def corporation_ids
          body
        end
      end
    end
  end
end
