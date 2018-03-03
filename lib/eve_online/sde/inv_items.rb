# frozen_string_literal: true

module EveOnline
  module SDE
    class InvItems < Base
      def inv_items
        output = []
        data.each do |inv_item|
          output << EveOnline::SDE::Models::InvItem.new(inv_item)
        end
        output
      end
      memoize :inv_items
    end
  end
end
