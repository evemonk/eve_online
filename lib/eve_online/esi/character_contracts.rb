# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterContracts < Base
      API_PATH = "/v1/characters/%<character_id>s/contracts/"

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def contracts
        @contracts ||=
          begin
            output = []
            response.each do |contract|
              output << Models::Contract.new(contract)
            end
            output
          end
      end

      def scope
        "esi-contracts.read_character_contracts.v1"
      end

      def additional_query_params
        [:page]
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end
