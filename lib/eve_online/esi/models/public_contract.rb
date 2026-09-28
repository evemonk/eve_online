# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class PublicContract < Object
        def as_json
          {
            buyout: attributes.buyout,
            collateral: attributes.collateral,
            contract_id: attributes.contract_id,
            date_expired: attributes.date_expired,
            date_issued: attributes.date_issued,
            days_to_complete: attributes.days_to_complete,
            end_location_id: attributes.end_location_id,
            for_corporation: attributes.for_corporation,
            issuer_corporation_id: attributes.issuer_corporation_id,
            issuer_id: attributes.issuer_id,
            price: attributes.price,
            reward: attributes.reward,
            start_location_id: attributes.start_location_id,
            title: attributes.title,
            type: attributes.type,
            volume: attributes.volume
          }
        end
      end
    end
  end
end
