# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class CharacterPortrait < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%<character_id>s/portrait/?datasource=tranquility'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def_delegators :model, :as_json, :tiny, :small, :medium, :large, :huge,
                     :gigantic

      def model
        Models::CharacterPortrait.new(response)
      end
      memoize :model

      def scope; end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end
