# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PublicContract < Base
        def as_json
          {
            buyout: buyout,
            collateral: collateral,
            contract_id: contract_id,
            date_expired: date_expired,
            date_issued: date_issued,
            days_to_complete: days_to_complete,
            end_location_id: end_location_id,
            for_corporation: for_corporation,
            issuer_corporation_id: issuer_corporation_id,
            issuer_id: issuer_id,
            price: price,
            reward: reward,
            start_location_id: start_location_id,
            title: title,
            kind: kind,
            volume: volume
          }
        end

        def buyout
          options["buyout"]
        end

        def collateral
          options["collateral"]
        end

        def contract_id
          options["contract_id"]
        end

        def date_expired
          date_expired = options["date_expired"]

          parse_datetime_with_timezone(date_expired) if date_expired
        end

        def date_issued
          date_issued = options["date_issued"]

          parse_datetime_with_timezone(date_issued) if date_issued
        end

        def days_to_complete
          options["days_to_complete"]
        end

        def end_location_id
          options["end_location_id"]
        end

        def for_corporation
          options["for_corporation"]
        end

        def issuer_corporation_id
          options["issuer_corporation_id"]
        end

        def issuer_id
          options["issuer_id"]
        end

        def price
          options["price"]
        end

        def reward
          options["reward"]
        end

        def start_location_id
          options["start_location_id"]
        end

        def title
          options["title"]
        end

        def kind
          options["type"]
        end

        def volume
          options["volume"]
        end
      end
    end
  end
end
