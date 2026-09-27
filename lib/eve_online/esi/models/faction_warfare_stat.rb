# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfareStat < Object
        def as_json
          {
            faction_id: attributes.faction_id,
            pilots: attributes.pilots,
            systems_controlled: attributes.systems_controlled
          }
        end

        def kills
          FactionWarfareStatSummary.new(attributes: attributes.kills)
        end

        def victory_points
          FactionWarfareStatSummary.new(attributes: attributes.victory_points)
        end
      end
    end
  end
end
