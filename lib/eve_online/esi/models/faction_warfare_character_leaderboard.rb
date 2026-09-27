# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareCharacterLeaderboard < Object
        def kills
          FactionWarfarePeriodBreakdown.new(attributes: attributes.kills, entry_type: FactionWarfareCharacterAmount)
        end

        def victory_points
          FactionWarfarePeriodBreakdown.new(attributes: attributes.victory_points, entry_type: FactionWarfareCharacterAmount)
        end
      end
    end
  end
end
