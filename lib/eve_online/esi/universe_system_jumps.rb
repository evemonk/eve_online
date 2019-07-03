# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystemJumps < Base
      API_PATH = '/v1/universe/system_jumps/'

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

      def path
        API_PATH
      end
    end
  end
end
