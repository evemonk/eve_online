# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class SovereigntyCampaign < Object
        def as_json
          {
            attackers_score: attributes.attackers_score,
            campaign_id: attributes.campaign_id,
            constellation_id: attributes.constellation_id,
            defender_id: attributes.defender_id,
            defender_score: attributes.defender_score,
            event_type: attributes.event_type,
            solar_system_id: attributes.solar_system_id,
            start_time: attributes.start_time,
            structure_id: attributes.structure_id
          }
        end

        def participants
          Collection.from_array(attributes.participants || [], type: SovereigntyCampaignParticipant)
        end
      end
    end
  end
end
