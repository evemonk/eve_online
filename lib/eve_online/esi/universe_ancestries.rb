# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseAncestries < Base
      API_PATH = "/v1/universe/ancestries/"

      def ancestries
        @ancestries ||=
          begin
            output = []
            response.each do |ancestry|
              output << Models::Ancestry.new(ancestry)
            end
            output
          end
      end

      def scope
      end

      def additional_query_params
        [:language]
      end

      def path
        API_PATH
      end
    end
  end
end
