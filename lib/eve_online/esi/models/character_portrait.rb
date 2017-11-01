module EveOnline
  module ESI
    module Models
      class CharacterPortrait < Base
        # https://eveonline-third-party-documentation.readthedocs.io/en/latest/imageserver/intro.html#character-images
        # Available Sizes: 32, 64, 128, 256, 512, 1024
        # https://nethackwiki.com/wiki/Physical_size
        # Tiny = 0; Small = 1; Medium = 2; Large = 3; Huge = 4; Gigantic = 7.
        def as_json
          {
            small: small,
            medium: medium,
            large: large,
            huge: huge
          }
        end

        def tiny
          # FIXME: https://github.com/ccpgames/esi-issues/issues/270
          # FIXME: https://github.com/ccpgames/esi-issues/issues/131
          raise NotImplementedError
        end

        def small
          options['px64x64']
        end

        def medium
          options['px128x128']
        end

        def large
          options['px256x256']
        end

        def huge
          options['px512x512']
        end

        def gigantic
          # FIXME: https://github.com/ccpgames/esi-issues/issues/270
          # FIXME: https://github.com/ccpgames/esi-issues/issues/131
          raise NotImplementedError
        end
      end
    end
  end
end
