# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class FreelanceJobDetails < Object
        def as_json
          {
            career: attributes.career,
            created: attributes.created,
            description: attributes.description,
            expires: attributes.expires,
            finished: attributes.finished
          }
        end

        def creator
          FreelanceJobCreator.new(attributes: attributes.creator) if attributes.creator
        end
      end
    end
  end
end
