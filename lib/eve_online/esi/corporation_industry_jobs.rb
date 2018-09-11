# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationIndustryJobs < Base
      API_ENDPOINT = 'https://esi.evetech.net/v1/corporations/%<corporation_id>s/industry/jobs/?datasource=%<datasource>s&include_completed=%<include_completed>s&page=%<page>s'

      attr_reader :corporation_id, :include_completed, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @include_completed = options.fetch(:include_completed, false)
        @page = options.fetch(:page, 1)
      end

      def jobs
        output = []
        response.each do |job|
          output << Models::CorporationIndustryJob.new(job)
        end
        output
      end
      memoize :jobs

      def total_pages
        resource.headers['x-pages']&.to_i
      end

      def scope
        'esi-industry.read_corporation_jobs.v1'
      end

      def url
        format(API_ENDPOINT, corporation_id: corporation_id, include_completed: include_completed, datasource: datasource, page: page)
      end
    end
  end
end
