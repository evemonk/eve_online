# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareLeaderboard < Object
        def kills
          FactionWarfarePeriodBreakdown.new(attributes: attributes.kills, entry_type: FactionWarfareAmount)
        end

        def victory_points
          FactionWarfarePeriodBreakdown.new(attributes: attributes.victory_points, entry_type: FactionWarfareAmount)
        end
      end
    end
  end
end
