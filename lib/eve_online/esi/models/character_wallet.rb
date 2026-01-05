# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterWallet < Object
        def as_json
          {
            wallet: wallet
          }
        end

        def wallet
          body
        end
      end
    end
  end
end
