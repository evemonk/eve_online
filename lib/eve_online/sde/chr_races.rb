module EveOnline
  module SDE
    class ChrRaces < Base
      def chr_races
        output = []
        data.each do |chr_race|
          output << EveOnline::SDE::Models::ChrRace.new(chr_race)
        end
        output
      end
      memoize :chr_races
    end
  end
end
