# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterWalletTransactions < Base
      API_PATH = "/v1/characters/%<character_id>s/wallet/transactions/"

      attr_reader :character_id, :from_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @from_id = options.fetch(:from_id, nil)
      end

      def wallet_transactions
        @wallet_transactions ||=
          begin
            output = []
            response.each do |wallet_transaction|
              output << Models::WalletTransaction.new(wallet_transaction)
            end
            output
          end
      end

      def scope
        "esi-wallet.read_character_wallet.v1"
      end

      def additional_query_params
        [:from_id]
      end

      def path
        format(API_PATH, character_id: character_id)
      end
    end
  end
end
