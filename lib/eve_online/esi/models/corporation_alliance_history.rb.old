# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CorporationAllianceHistory < Base
        def as_json
          {
            alliance_id: alliance_id,
            is_deleted: is_deleted,
            record_id: record_id,
            start_date: start_date
          }
        end

        def alliance_id
          options["alliance_id"]
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
