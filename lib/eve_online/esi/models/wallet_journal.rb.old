# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class WalletJournal < Base
        def as_json
          {
            amount: amount,
            balance: balance,
            context_id: context_id,
            context_id_type: context_id_type,
            date: date,
            description: description,
            first_party_id: first_party_id,
            wallet_journal_id: wallet_journal_id,
            reason: reason,
            ref_type: ref_type,
            second_party_id: second_party_id,
            tax: tax,
            tax_receiver_id: tax_receiver_id
          }
        end

        def amount
          options["amount"]
        end

        def balance
          options["balance"]
        end

        def context_id
          options["context_id"]
        end

        def context_id_type
          options["context_id_type"]
        end

        def date
          date = options["date"]

          parse_datetime_with_timezone(date) if date
        end

        def description
          options["description"]
        end

        def first_party_id
          options["first_party_id"]
        end

        def wallet_journal_id
          options["id"]
        end

        def reason
          options["reason"]
        end

        def ref_type
          options["ref_type"]
        end

        def second_party_id
          options["second_party_id"]
        end

        def tax
          options["tax"]
        end

        def tax_receiver_id
          options["tax_receiver_id"]
        end
      end
    end
  end
end
