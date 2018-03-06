# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class WalletJournalEntry < Base
        def as_json
          {
            date: date,
            ref_id: ref_id,
            ref_type: ref_type,
            first_party_id: first_party_id,
            first_party_type: first_party_type,
            second_party_id: second_party_id,
            second_party_type: second_party_type,
            amount: amount,
            balance: balance,
            reason: reason,
            tax_receiver_id: tax_receiver_id,
            tax: tax
            # TODO: add extra_info
          }
        end

        def date
          date = options['date']

          parse_datetime_with_timezone(date) if date
        end

        def ref_id
          options['ref_id']
        end

        def ref_type
          options['ref_type']
        end

        def first_party_id
          options['first_party_id']
        end

        def first_party_type
          options['first_party_type']
        end

        def second_party_id
          options['second_party_id']
        end

        def second_party_type
          options['second_party_type']
        end

        def amount
          options['amount']
        end

        def balance
          options['balance']
        end

        def reason
          options['reason']
        end

        def tax_receiver_id
          options['tax_receiver_id']
        end

        def tax
          options['tax']
        end
      end
    end
  end
end
