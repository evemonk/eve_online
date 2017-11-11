module EveOnline
  module ESI
    module Models
      class Bloodline < Base
        def as_json
          {
            bloodline_id: bloodline_id,
            name: name,
            description: description,
            race_id: race_id,
            ship_type_id: ship_type_id,
            corporation_id: corporation_id,
            perception: perception,
            willpower: willpower,
            charisma: charisma,
            memory: memory,
            intelligence: intelligence
          }
        end

        def bloodline_id
          options['bloodline_id']
        end

        def name
          options['name']
        end

        def description
          options['description']
        end

        def race_id
          options['race_id']
        end

        def ship_type_id
          options['ship_type_id']
        end

        def corporation_id
          options['corporation_id']
        end

        def perception
          options['perception']
        end

        def willpower
          options['willpower']
        end

        def charisma
          options['charisma']
        end

        def memory
          options['memory']
        end

        def intelligence
          options['intelligence']
        end
      end
    end
  end
end
