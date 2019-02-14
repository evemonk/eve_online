# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseBloodlines < Base
      API_PATH = '/v1/universe/bloodlines/?datasource=%<datasource>s'

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

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end
