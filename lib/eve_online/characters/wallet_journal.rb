module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_walletjournal.html
    class WalletJournal < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/WalletJournal.xml.aspx'.freeze

      ACCESS_MASK = 2_097_152

      attr_reader :key_id, :v_code, :character_id, :account_key, :from_id, :row_count

      def initialize(key_id, v_code, character_id, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @account_key = options.fetch(:account_key, 1000)
        @from_id = options.fetch(:from_id, nil)
        @row_count = options.fetch(:row_count, nil)
      end

      # TODO: memoizate
      def wallet_journal_entries
        case row
        when Hash
          [WalletJournalEntry.new(row)]
        when Array
          output = []
          row.each do |blueprint|
            output << WalletJournalEntry.new(blueprint)
          end
          output
        else
          raise ArgumentError
        end
      end

      def url
        @url ||= begin
          output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&accountKey=#{ account_key }"
          output = "#{ output }&fromID=#{ from_id }" if from_id
          output = "#{ output }&rowCount=#{ row_count }" if row_count
          output
        end
      end

      private

      def rowset
        @rowset ||= result.fetch('rowset')
      end

      def row
        @row ||= rowset.fetch('row')
      end
    end
  end
end
