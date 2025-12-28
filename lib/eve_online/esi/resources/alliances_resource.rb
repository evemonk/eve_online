# frozen_string_literal: true

module EveOnline
  module ESI
    module Resources
      class AlliancesResource < Resource
        # @param id [Integer] The ID of the alliance
        def retrieve(id:)
          Models::Alliance.new(get_request("alliances/#{id}"))
        end

        def list

        end
      end
    end
  end
end
