# frozen_string_literal: true

module EveOnline
  module SDE
    class AgtAgents < Base
      def agt_agents
        output = []
        data.each do |agt_agent|
          output << EveOnline::SDE::Models::AgtAgent.new(agt_agent)
        end
        output
      end
      memoize :agt_agents
    end
  end
end
