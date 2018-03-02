module EveOnline
  module ESI
    class CharacterIndustryJobs < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%<character_id>s/industry/jobs/?datasource=tranquility&include_completed=%<include_completed>s'.freeze

      attr_reader :character_id, :include_completed

      def initialize(options)
        super

        @character_id = options[:character_id]
        @include_completed = options[:include_completed] ? true : false
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
        format(API_ENDPOINT, character_id: character_id, include_completed: include_completed)
      end
    end
  end
end
