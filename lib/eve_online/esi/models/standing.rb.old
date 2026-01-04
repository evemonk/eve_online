# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Standing < Base
        def as_json
          {
            from_id: from_id,
            from_type: from_type,
            standing: standing
          }
        end

        def from_id
          options["from_id"]
        end

        def from_type
          options["from_type"]
        end

        def standing
          options["standing"]
        end
      end
    end
  end
end
