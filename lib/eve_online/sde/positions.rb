module EveOnline
  module SDE
    class Positions < Base
      def positions
        output = []
        data.each do |position|
          output << EveOnline::SDE::Models::Position.new(position)
        end
        output
      end
      memoize :positions
    end
  end
end
