# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class ContractBid < Object
        def as_json
          {
            amount: attributes.amount,
            bid_id: attributes.bid_id,
            date_bid: attributes.date_bid
          }
        end
      end
    end
  end
end
