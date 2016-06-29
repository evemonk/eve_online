module EveOnline
  class Blueprint
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        item_id: item_id,
        location_id: location_id,
        type_id: type_id,
        type_name: type_name,
        flag_id: flag_id,
        quantity: quantity,
        time_efficiency: time_efficiency,
        material_efficiency: material_efficiency,
        runs: runs
      }
    end

    def item_id
      @item_id ||= options.fetch('@itemID').to_i
    end

    def location_id
      @location_id ||= options.fetch('@locationID').to_i
    end

    def type_id
      @type_id ||= options.fetch('@typeID').to_i
    end

    def type_name
      @type_name ||= options.fetch('@typeName')
    end

    def flag_id
      @flag_id ||= options.fetch('@flagID').to_i
    end

    # TODO: return EveOnline::Blueprint::Quantity
    def quantity
      @quantity ||= options.fetch('@quantity').to_i
    end

    def time_efficiency
      @time_efficiency ||= options.fetch('@timeEfficiency').to_i
    end

    def material_efficiency
      @material_efficiency ||= options.fetch('@materialEfficiency').to_i
    end

    def runs
      @runs ||= options.fetch('@runs').to_i
    end
  end
end
