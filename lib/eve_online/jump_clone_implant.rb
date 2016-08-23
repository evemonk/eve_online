module EveOnline
  class JumpCloneImplant
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        jump_clone_id: jump_clone_id,
        type_id: type_id,
        type_name: type_name
      }
    end

    def jump_clone_id
      @jump_clone_id ||= options.fetch('@jumpCloneID').to_i
    end

    def type_id
      @type_id ||= options.fetch('@typeID').to_i
    end

    def type_name
      @type_name ||= options.fetch('@typeName')
    end
  end
end
