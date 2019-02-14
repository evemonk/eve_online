# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystemJumps < Base
      API_PATH = '/v1/universe/system_jumps/?datasource=%<datasource>s'

      def system_jumps
        @system_jumps ||=
          begin
            output = []
            response.each do |system_jump|
              output << Models::SystemJump.new(system_jump)
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
