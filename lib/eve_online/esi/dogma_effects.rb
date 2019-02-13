# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaEffects < Base
      API_PATH = '/v1/dogma/effects/?datasource=%<datasource>s'

      def effect_ids
        response
      end

      def scope; end

      def url
        format("#{ API_HOST }#{ API_PATH }", datasource: datasource)
      end
    end
  end
end
