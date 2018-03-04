# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Attributes < Base
        def as_json
          {
            charisma: charisma,
            intelligence: intelligence,
            memory: memory,
            perception: perception,
            willpower: willpower,
            bonus_remaps: bonus_remaps,
            last_remap_date: last_remap_date,
            accrued_remap_cooldown_date: accrued_remap_cooldown_date
          }
        end

        def charisma
          options['charisma']
        end

        def intelligence
          options['intelligence']
        end

        def memory
          options['memory']
        end

        def perception
          options['perception']
        end

        def willpower
          options['willpower']
        end

        def bonus_remaps
          options['bonus_remaps']
        end

        def last_remap_date
          last_remap_date = options['last_remap_date']

          parse_datetime_with_timezone(last_remap_date) if last_remap_date
        end

        def accrued_remap_cooldown_date
          accrued_remap_cooldown_date = options['accrued_remap_cooldown_date']

          parse_datetime_with_timezone(accrued_remap_cooldown_date) if accrued_remap_cooldown_date
        end
      end
    end
  end
end
