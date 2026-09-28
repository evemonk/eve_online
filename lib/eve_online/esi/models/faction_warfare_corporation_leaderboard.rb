# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareCorporationLeaderboard < Object
        def kills
          FactionWarfarePeriodBreakdown.new(attributes: attributes.kills, entry_type: FactionWarfareCorporationAmount)
        end

        def victory_points
          FactionWarfarePeriodBreakdown.new(attributes: attributes.victory_points, entry_type: FactionWarfareCorporationAmount)
        end
      end
    end
  end
end
