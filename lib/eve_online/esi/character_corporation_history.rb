# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterCorporationHistory < Base
      API_PATH = '/v1/characters/%<character_id>s/corporationhistory/'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
      end

      def entries
        @entries ||=
          begin
            output = []
            response.each do |record|
              output << Models::CharacterCorporationHistory.new(record)
            end
            output
          end
      end

      def scope; end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end
