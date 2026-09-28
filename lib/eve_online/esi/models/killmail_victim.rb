# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class KillmailVictim < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            character_id: attributes.character_id,
            corporation_id: attributes.corporation_id,
            damage_taken: attributes.damage_taken,
            faction_id: attributes.faction_id,
            ship_type_id: attributes.ship_type_id
          }
        end

        def items
          Collection.from_array(attributes.items || [], type: KillmailItem)
        end

        def position
          Position.new(attributes: attributes.position) if attributes.position
        end
      end
    end
  end
end
