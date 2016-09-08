require 'active_support/time'

module EveOnline
  class Bookmark
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        bookmark_id: bookmark_id,
        creator_id: creator_id,
        created: created,
        item_id: item_id,
        type_id: type_id,
        location_id: location_id,
        x: x,
        y: y,
        z: z,
        memo: memo,
        note: note
      }
    end

    def bookmark_id
      options.fetch('@bookmarkID').to_i
    end

    def creator_id
      options.fetch('@creatorID').to_i
    end

    def created
      ActiveSupport::TimeZone['UTC'].parse(options.fetch('@created'))
    end

    def item_id
      options.fetch('@itemID').to_i
    end

    def type_id
      options.fetch('@typeID').to_i
    end

    def location_id
      options.fetch('@locationID').to_i
    end

    def x
      options.fetch('@x').to_f
    end

    def y
      options.fetch('@y').to_f
    end

    def z
      options.fetch('@z').to_f
    end

    def memo
      options.fetch('@memo')
    end

    def note
      options.fetch('@note')
    end
  end
end
