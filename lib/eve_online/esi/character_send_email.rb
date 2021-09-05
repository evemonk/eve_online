# frozen_string_literal: true

module EveOnline
  module ESI
    class CharacterSendEmail < Base
      API_PATH = "/v1/characters/%<character_id>/mail/"

      def scope
        "esi-mail.send_mail.v1"
      end
    end
  end
end
