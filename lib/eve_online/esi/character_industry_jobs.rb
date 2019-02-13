# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterIndustryJobs < Base
      API_PATH = '/v1/characters/%<character_id>s/industry/jobs/?datasource=%<datasource>s&include_completed=%<include_completed>s'

      attr_reader :character_id, :include_completed

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @include_completed = options.fetch(:include_completed, false)
      end

      def jobs
        @jobs ||=
          begin
            output = []
            response.each do |job|
              output << Models::CharacterIndustryJob.new(job)
            end
            output
          end
      end

      def scope
        'esi-industry.read_character_jobs.v1'
      end

      def url
        format("#{ API_HOST }#{ API_PATH }", character_id: character_id, include_completed: include_completed, datasource: datasource)
      end
    end
  end
end
