# frozen_string_literal: true

module EveOnline
  module ESI
    class Wars < Base
      API_PATH = '/v1/wars/?datasource=%<datasource>s'

      # TODO: add max_war_id
      # def initialize(max_war_id)
      #   @max_war_id = max_war_id
      # end

      def war_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end
