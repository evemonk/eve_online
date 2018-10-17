# frozen_string_literal: true

module EveOnline
  module ESI
    class UniverseSystemKills < Base
      API_ENDPOINT = 'https://esi.evetech.net/v2/universe/system_kills/?datasource=%<datasource>s'

      def system_kills
        output = []
        response.each do |system_kill|
          output << Models::SystemKill.new(system_kill)
        end
        output
      end
      memoize :system_kills

      def scope; end

      def url
        format(API_ENDPOINT, datasource: datasource)
      end
    end
  end
end
