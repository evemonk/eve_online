module EveOnline
  module ESI
    class CharacterPortrait < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%s/portrait/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(character_id)
        super()
        @character_id = character_id
      end

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
        response['px64x64']
      end

      def medium
        response['px128x128']
      end

      def large
        response['px256x256']
      end

      def huge
        response['px512x512']
      end

      def gigantic
        # FIXME: https://github.com/ccpgames/esi-issues/issues/270
        # FIXME: https://github.com/ccpgames/esi-issues/issues/131
        raise NotImplementedError
      end

      def scope; end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end
