module EveOnline
  class Implant
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        type_id: type_id,
        type_name: type_name
      }
    end

    def type_id
      options.fetch('@typeID').to_i
    end

    def type_name
      options.fetch('@typeName')
    end
  end
end
