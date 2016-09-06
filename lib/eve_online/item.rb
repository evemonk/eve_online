module EveOnline
  class Item
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        item_id: item_id,
        location_id: location_id,
        type_id: type_id,
        quantity: quantity,
        flag: flag,
        singleton: singleton,
        raw_quantity: raw_quantity
      }
    end

    def item_id
      options.fetch('@itemID').to_i
    end

    def location_id
      options.fetch('@locationID').to_i
    end

    def type_id
      options.fetch('@typeID').to_i
    end

    def quantity
      options.fetch('@quantity').to_i
    end

    def flag
      options.fetch('@flag').to_i
    end

    def singleton
      options.fetch('@singleton').to_i
    end

    def raw_quantity
      options.fetch('@rawQuantity').to_i
    end
  end
end
