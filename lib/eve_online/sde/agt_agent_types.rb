module EveOnline
  module SDE
    class AgtAgentTypes < Base
      def agt_agents_types
        output = []
        data.each do |agt_agents_type|
          output << EveOnline::SDE::Models::AgtAgentType.new(agt_agents_type)
        end
        output
      end
      memoize :agt_agents_types
    end
  end
end
