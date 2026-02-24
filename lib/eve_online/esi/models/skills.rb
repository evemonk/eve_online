# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Skills < Object
        def as_json
          {
            total_sp: attributes.total_sp,
            unallocated_sp: attributes.unallocated_sp
          }
        end

        def skills
          @skills ||= Collection.from_array(attributes.skills, type: Skill)
        end
      end
    end
  end
end
