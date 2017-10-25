module EveOnline
  module ESI
    class IndustryCharacterJobs < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/industry/jobs/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
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
        'esi-industry.read_character_jobs.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end