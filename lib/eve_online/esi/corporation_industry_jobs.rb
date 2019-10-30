# frozen_string_literal: true

module EveOnline
  module ESI
    class CorporationIndustryJobs < Base
      API_PATH = '/v1/corporations/%<corporation_id>s/industry/jobs/'

      attr_reader :corporation_id, :include_completed, :page

      def initialize(options)
        super

        @corporation_id = options.fetch(:corporation_id)
        @include_completed = options.fetch(:include_completed, nil)
        @page = options.fetch(:page, 1)
      end

      def jobs
        @jobs ||=
          begin
            output = []
            response.each do |job|
              output << Models::CorporationIndustryJob.new(job)
            end
            output
          end
      end

      def scope
        'esi-industry.read_corporation_jobs.v1'
      end

      def roles
        ['Factory_Manager']
      end

      def additional_query_params
        [:include_completed, :page]
      end

      def path
        format(API_PATH, corporation_id: corporation_id)
      end
    end
  end
end
