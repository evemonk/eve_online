# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Skills < Object
        def total_sp
          attributes.total_sp
        end

        def unallocated_sp
          attributes.unallocated_sp
        end
      end
    end
  end
end

