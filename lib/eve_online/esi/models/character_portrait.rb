# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterPortrait < Object
        def as_json
          {
            medium: medium,
            large: large,
            huge: huge,
            small: small
          }
        end

        def medium
          attributes.px128x128
        end

        def large
          attributes.px256x256
        end

        def huge
          attributes.px512x512
        end

        def small
          attributes.px64x64
        end
      end
    end
  end
end
