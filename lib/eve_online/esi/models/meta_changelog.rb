# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class MetaChangelog < Object
        def as_json
          {
            changelog: changelog
          }
        end

        def changelog
          attributes.changelog
        end
      end
    end
  end
end
