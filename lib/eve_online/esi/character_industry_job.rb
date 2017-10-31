module EveOnline
  module ESI
    class CharacterIndustryJob < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/industry/jobs/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
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
        'esi-industry.read_character_jobs.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end