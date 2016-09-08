module EveOnline
  class JumpClone
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        jump_clone_id: jump_clone_id,
        type_id: type_id,
        location_id: location_id,
        clone_name: clone_name
      }
    end

    def jump_clone_id
      options.fetch('@jumpCloneID').to_i
    end

    def type_id
      options.fetch('@typeID').to_i
    end

    def location_id
      options.fetch('@locationID').to_i
    end

    def clone_name
      options.fetch('@cloneName')
    end
  end
end
