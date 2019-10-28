# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterWalletJournal < Base
      API_PATH = '/v6/characters/%<character_id>s/wallet/journal/'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def wallet_journal_entries
        @wallet_journal_entries ||=
          begin
            output = []
            response.each do |wallet_journal_entry|
              output << Models::WalletJournalEntry.new(wallet_journal_entry)
            end
            output
          end
      end

      def scope
        'esi-wallet.read_character_wallet.v1'
      end

      def additional_query_params
        [:page]
      end

      def path
        format("#{ API_PATH }", character_id: character_id)
      end
    end
  end
end
