# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterWalletJournal < Base
      API_ENDPOINT = 'https://esi.evetech.net/v4/characters/%<character_id>s/wallet/journal/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def wallet_journal_entries
        output = []
        response.each do |wallet_journal_entry|
          output << Models::WalletJournalEntry.new(wallet_journal_entry)
        end
        output
      end
      memoize :wallet_journal_entries

      def total_pages
        resource.headers['x-pages']&.to_i
      end

      def scope
        'esi-wallet.read_character_wallet.v1'
      end

      def url
        format(API_ENDPOINT, character_id: character_id, datasource: datasource, page: page)
      end
    end
  end
end
