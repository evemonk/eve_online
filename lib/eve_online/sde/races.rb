module EveOnline
  module SDE
    class Races < Base
      def races
        output = []
        data.each do |race|
          output << EveOnline::SDE::Models::Race.new(race)
        end
        output
      end
      memoize :races
    end
  end
end
