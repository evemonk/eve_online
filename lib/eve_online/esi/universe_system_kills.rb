# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystemKills < Base
      API_PATH = '/v2/universe/system_kills/'

      def system_kills
        @system_kills ||=
          begin
            output = []
            response.each do |system_kill|
              output << Models::SystemKill.new(system_kill)
            end
            output
          end
      end

      def scope; end

      def path
        API_PATH
      end
    end
  end
end
