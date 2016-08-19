module EveOnline
  class Standing
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        from_id: from_id,
        from_name: from_name,
        standing: standing
      }
    end

    def from_id
      @from_id ||= options.fetch('@fromID').to_i
    end

    def from_name
      @from_name ||= options.fetch('@fromName')
    end

    def standing
      @standing ||= options.fetch('@standing').to_f
    end
  end
end
