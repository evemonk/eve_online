# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class WalletTransaction < Base
        def as_json
          {
            client_id: client_id,
            date: date,
            is_buy: is_buy,
            is_personal: is_personal,
            journal_ref_id: journal_ref_id,
            location_id: location_id,
            quantity: quantity,
            transaction_id: transaction_id,
            type_id: type_id,
            unit_price: unit_price
          }
        end

        def client_id
          options["client_id"]
        end

        def date
          date = options["date"]

          parse_datetime_with_timezone(date) if date
        end

        def is_buy
          options["is_buy"]
        end

        def is_personal
          options["is_personal"]
        end

        def journal_ref_id
          options["journal_ref_id"]
        end

        def location_id
          options["location_id"]
        end

        def quantity
          options["quantity"]
        end

        def transaction_id
          options["transaction_id"]
        end

        def type_id
          options["type_id"]
        end

        def unit_price
          options["unit_price"]
        end
      end
    end
  end
end
