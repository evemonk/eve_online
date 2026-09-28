# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Character < Object
        def as_json
          {
            achievement_score: attributes.achievement_score,
            alliance_id: attributes.alliance_id,
            birthday: attributes.birthday,
            bloodline_id: attributes.bloodline_id,
            character_title_id: attributes.character_title_id,
            corporation_id: attributes.corporation_id,
            corporation_title: attributes.corporation_title,
            description: attributes.description,
            faction_id: attributes.faction_id,
            gender: attributes.gender,
            name: attributes.name,
            race_id: attributes.race_id,
            security_status: attributes.security_status
          }
        end
      end
    end
  end
end
