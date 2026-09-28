# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FactionWarfarePeriodBreakdown < Object
        # @param attributes [Hash] The yesterday/last_week/active_total breakdown
        # @param entry_type [Class] The Model class to wrap each entry with
        def initialize(attributes:, entry_type:)
          super(attributes: attributes)

          @entry_type = entry_type
        end

        def yesterday
          Collection.from_array(attributes.yesterday || [], type: @entry_type)
        end

        def last_week
          Collection.from_array(attributes.last_week || [], type: @entry_type)
        end

        def active_total
          Collection.from_array(attributes.active_total || [], type: @entry_type)
        end
      end
    end
  end
end
