# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterCorporationHistory < Object
        def as_json
          {
            corporation_id: attributes.corporation_id,
            is_deleted: attributes.is_deleted,
            record_id: attributes.record_id,
            start_date: attributes.start_date
          }
        end
      end
    end
  end
end
