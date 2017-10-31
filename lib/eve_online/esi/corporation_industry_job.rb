module EveOnline
  module ESI
    class CorporationIndustryJob < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%s/industry/jobs/?datasource=tranquility'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
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
        API_ENDPOINT % corporation_id
      end
    end
  end
end