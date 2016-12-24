module EveOnline
  module SDE
    class InvNames < Base
      def inv_names
        output = []
        data.each do |inv_name|
          output << EveOnline::SDE::Models::InvName.new(inv_name)
        end
        output
      end
      memoize :inv_names
    end
  end
end
