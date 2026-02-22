# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Attributes < Object
        def as_json
          {
            accrued_remap_cooldown_date: attributes.accrued_remap_cooldown_date,
            bonus_remaps: attributes.bonus_remaps,
            charisma: attributes.charisma,
            intelligence: attributes.intelligence,
            last_remap_date: attributes.last_remap_date,
            memory: attributes.memory,
            perception: attributes.perception,
            willpower: attributes.willpower
          }
        end
      end
    end
  end
end
