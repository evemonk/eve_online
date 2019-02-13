# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseAncestries < Base
      API_PATH = '/v1/universe/ancestries/?datasource=%<datasource>s'

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

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end
