# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class CharacterGetMail < Base
      extend Forwardable

      API_PATH = "/v1/characters/%<character_id>s/mail/%<mail_id>s/"

      attr_reader :character_id, :mail_id

      def initialize(options)
        super

        @character_id = options.fetch(:character_id)
        @mail_id = options.fetch(:mail_id)
      end

      def_delegators :model, :as_json, :body, :from_id, :read, :subject,
        :timestamp, :label_ids, :recipients

      def model
        @model ||= Models::Mail.new(response)
      end

      def scope
        "esi-mail.read_mail.v1"
      end

      def path
        format(API_PATH, character_id: character_id, mail_id: mail_id)
      end
    end
  end
end
