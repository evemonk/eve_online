# frozen_string_literal: true

module EveOnline
  module SDE
    class InvPositions < Base
      def inv_positions
        output = []
        data.each do |inv_position|
          output << EveOnline::SDE::Models::InvPosition.new(inv_position)
        end
        output
      end
      memoize :inv_positions
    end
  end
end
