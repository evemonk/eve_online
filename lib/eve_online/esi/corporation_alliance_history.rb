# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationAllianceHistory < Base
      API_PATH = '/v2/corporations/%<corporation_id>s/alliancehistory/'

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
      end

      def entries
        @entries ||=
          begin
            output = []
            response.each do |record|
              output << Models::CorporationAllianceHistory.new(record)
            end
            output
          end
      end

      def scope; end

      def path
        format("#{ API_PATH }", corporation_id: corporation_id)
      end
    end
  end
end
