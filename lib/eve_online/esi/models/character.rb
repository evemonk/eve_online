# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Character < Object
        def as_json
          {
            alliance_id: attributes.alliance_id,
            birthday: attributes.birthday,
            bloodline_id: attributes.bloodline_id,
            corporation_id: attributes.corporation_id,
            description: attributes.description,
            faction_id: attributes.faction_id,
            gender: attributes.gender,
            name: attributes.name,
            race_id: attributes.race_id,
            security_status: attributes.security_status,
            title: attributes.title
          }
        end
      end
    end
  end
end
