# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationIndustryJobs < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/corporations/%<corporation_id>s/industry/jobs/?datasource=tranquility&include_completed=%<include_completed>s'.freeze

      attr_reader :corporation_id, :include_completed

      def initialize(options)
        super

        @corporation_id = options[:corporation_id]
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
        'esi-industry.read_corporation_jobs.v1'
      end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id, include_completed: include_completed)
      end
    end
  end
end
