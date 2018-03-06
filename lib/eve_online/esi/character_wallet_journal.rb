# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterWalletJournal < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v3/characters/%<character_id>s/wallet/journal/?datasource=tranquility'

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def wallet_journal_entries
        output = []
        response.each do |wallet_journal_entry|
          output << Models::WalletJournalEntry.new(wallet_journal_entry)
        end
        output
      end
      memoize :wallet_journal_entries

      def scope
        'esi-wallet.read_character_wallet.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id)
      end
    end
  end
end
