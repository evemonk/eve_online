# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class KillmailDetail < Object
        def as_json
          {
            killmail_id: attributes.killmail_id,
            killmail_time: attributes.killmail_time,
            moon_id: attributes.moon_id,
            solar_system_id: attributes.solar_system_id,
            war_id: attributes.war_id
          }
        end

        def attackers
          Collection.from_array(attributes.attackers || [], type: KillmailAttacker)
        end

        def victim
          KillmailVictim.new(attributes: attributes.victim)
        end
      end
    end
  end
end
