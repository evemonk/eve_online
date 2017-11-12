module EveOnline
  module ESI
    class CorporationIndustryJob < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%s/industry/jobs/?datasource=tranquility&include_completed=%s'.freeze

      attr_reader :corporation_id, :include_completed

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
        @include_completed = "false" if options[:include_completed].nil?
      end

      def jobs
        output = []
        response.each do |job|
          output << Models::IndustryJob.new(job)
        end
        output
      end
      memoize :jobs

      def scope
        'esi-industry.read_corporation_jobs.v1'
      end

      def url
        API_ENDPOINT % [corporation_id, include_completed]
      end
    end
  end
end