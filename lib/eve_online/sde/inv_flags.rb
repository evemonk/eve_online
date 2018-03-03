# frozen_string_literal: true

module EveOnline
  module SDE
    class InvFlags < Base
      def inv_flags
        output = []
        data.each do |inv_flag|
          output << EveOnline::SDE::Models::InvFlag.new(inv_flag)
        end
        output
      end
      memoize :inv_flags
    end
  end
end
