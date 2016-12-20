module EveOnline
  module SDE
    class Flags < Base
      def flags
        output = []
        data.each do |flag|
          output << EveOnline::SDE::Models::Flag.new(flag)
        end
        output
      end
      memoize :flags
    end
  end
end
