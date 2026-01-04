# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Allies < Base
        def allies
          output = []

          return output unless options.is_a?(Array)

          options.each do |ally|
            output << Ally.new(ally)
          end

          output
        end
      end
    end
  end
end
