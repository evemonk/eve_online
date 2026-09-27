# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobsListing < Object
        def cursor
          FreelanceJobsCursor.new(attributes: attributes.cursor) if attributes.cursor
        end

        def freelance_jobs
          Collection.from_array(attributes.freelance_jobs || [], type: FreelanceJobSummary)
        end
      end
    end
  end
end
