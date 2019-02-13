# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystemKills < Base
      API_PATH = '/v2/universe/system_kills/?datasource=%<datasource>s'

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

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end
