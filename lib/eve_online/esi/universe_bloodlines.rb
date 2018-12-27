# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseBloodlines < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/universe/bloodlines/?datasource=%<datasource>s'

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
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
