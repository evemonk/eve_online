# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class War < Object
        def as_json
          {
            declared: attributes.declared,
            finished: attributes.finished,
            id: attributes.id,
            mutual: attributes.mutual,
            open_for_allies: attributes.open_for_allies,
            retracted: attributes.retracted,
            started: attributes.started
          }
        end

        def defender
          @defender ||= Defender.new(attributes: attributes.defender)
        end

        def aggressor
          @aggressor ||= Aggressor.new(attributes: attributes.aggressor)
        end
      end
    end
  end
end
