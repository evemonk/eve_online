module EveOnline
  module SDE
    class Items < Base
      def items
        output = []
        data.each do |item|
          output << EveOnline::SDE::Models::Item.new(item)
        end
        output
      end
      memoize :items
    end
  end
end
