# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterCorporationHistory < Base
        def as_json
          {
            corporation_id: corporation_id,
            is_deleted: is_deleted,
            record_id: record_id,
            start_date: start_date
          }
        end

        def corporation_id
          options["corporation_id"]
        end

        def is_deleted
          options["is_deleted"]
        end

        def record_id
          options["record_id"]
        end

        def start_date
          start_date = options["start_date"]

          parse_datetime_with_timezone(start_date) if start_date
        end
      end
    end
  end
end
