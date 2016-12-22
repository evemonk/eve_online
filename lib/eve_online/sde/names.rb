module EveOnline
  module SDE
    class Names < Base
      def names
        output = []
        data.each do |name|
          output << EveOnline::SDE::Models::Name.new(name)
        end
        output
      end
      memoize :names
    end
  end
end
