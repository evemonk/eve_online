module EveOnline
  module ESI
    module Models
      class Division < Base
        def as_json
          {
            hangar: hangar,
            wallet: wallet
          }
        end

        def hangar
          options['hangar']
        end

        def wallet
          options['wallet']
        end
      end
    end
  end
end
