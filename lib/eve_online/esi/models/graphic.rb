# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Graphic < Object
        def as_json
          {
            collision_file: attributes.collision_file,
            graphic_file: attributes.graphic_file,
            graphic_id: attributes.graphic_id,
            icon_folder: attributes.icon_folder,
            sof_dna: attributes.sof_dna,
            sof_fation_name: attributes.sof_fation_name,
            sof_hull_name: attributes.sof_hull_name,
            sof_race_name: attributes.sof_race_name
          }
        end
      end
    end
  end
end
