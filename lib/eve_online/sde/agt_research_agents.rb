module EveOnline
  module SDE
    class AgtResearchAgents < Base
      def agt_research_agents
        output = []
        data.each do |agt_research_agent|
          output << EveOnline::SDE::Models::AgtResearchAgent.new(agt_research_agent)
        end
        output
      end
      memoize :agt_research_agents
    end
  end
end
