# frozen_string_literal: true

module EveOnline
  module SDE
    class AgtAgentTypes < Base
      def agt_agent_types
        output = []
        data.each do |agt_agent_type|
          output << EveOnline::SDE::Models::AgtAgentType.new(agt_agent_type)
        end
        output
      end
      memoize :agt_agent_types
    end
  end
end
