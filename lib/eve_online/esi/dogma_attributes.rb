# frozen_string_literal: true

module EveOnline
  module ESI
    class DogmaAttributes < Base
      API_PATH = '/v1/dogma/attributes/'

      def attribute_ids
        response
      end

      def scope; end

      def path
        API_PATH
      end
    end
  end
end
