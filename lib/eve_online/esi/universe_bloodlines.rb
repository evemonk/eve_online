# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseBloodlines < Base
      API_PATH = '/v1/universe/bloodlines/'

      def bloodlines
        @bloodlines ||=
          begin
            output = []
            response.each do |bloodline|
              output << Models::Bloodline.new(bloodline)
            end
            output
          end
      end

      def scope; end

      def additation_query_params
        [:language]
      end

      def path
        API_PATH
      end
    end
  end
end
