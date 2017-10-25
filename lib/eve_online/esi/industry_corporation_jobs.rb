module EveOnline
  module ESI
    class IndustryCorporationJobs < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%s/industry/jobs/?datasource=tranquility'.freeze

      attr_reader :corporation_id

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
      end

      def get_industry_jobs
        output = []
        response.each do |asset|
          output << Models::IndustryJobs.new(asset)
        end
        output
      end
      memoize :get_industry_jobs

      def scope
        'esi-industry.read_corporation_jobs.v1'
      end

      def url
        API_ENDPOINT % corporation_id
      end
    end
  end
end