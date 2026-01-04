# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Fatigue < Base
        def as_json
          {
            jump_fatigue_expire_date: jump_fatigue_expire_date,
            last_jump_date: last_jump_date,
            last_update_date: last_update_date
          }
        end

        def jump_fatigue_expire_date
          jump_fatigue_expire_date = options["jump_fatigue_expire_date"]

          parse_datetime_with_timezone(jump_fatigue_expire_date) if jump_fatigue_expire_date
        end

        def last_jump_date
          last_jump_date = options["last_jump_date"]

          parse_datetime_with_timezone(last_jump_date) if last_jump_date
        end

        def last_update_date
          last_update_date = options["last_update_date"]

          parse_datetime_with_timezone(last_update_date) if last_update_date
        end
      end
    end
  end
end
