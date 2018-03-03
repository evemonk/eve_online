# frozen_string_literal: true

require 'forwardable'

module EveOnline
  module ESI
    class CharacterOnline < Base
      extend Forwardable

      API_ENDPOINT = 'https://esi.tech.ccp.is/v2/characters/%<character_id>s/online/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def_delegators :model, :as_json, :online, :last_login, :last_logout,
                     :logins

      def model
        Models::Online.new(response)
      end
      memoize :model

      def scope
        'esi-location.read_online.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end
