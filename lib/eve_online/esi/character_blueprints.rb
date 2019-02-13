# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterBlueprints < Base
      API_PATH = '/v2/characters/%<character_id>s/blueprints/?datasource=%<datasource>s&page=%<page>s'

      attr_reader :character_id, :page

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @page = options.fetch(:page, 1)
      end

      def blueprints
        @blueprints ||=
          begin
            output = []
            response.each do |blueprint|
              output << Models::Blueprint.new(blueprint)
            end
            output
          end
      end

      def scope
        'esi-characters.read_blueprints.v1'
      end

      def url
        format("#{ API_HOST }#{ API_PATH }", character_id: character_id, datasource: datasource, page: page)
      end
    end
  end
end
