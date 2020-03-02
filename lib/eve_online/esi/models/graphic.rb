# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class Graphic < Base
        def as_json
          {
            collision_file: collision_file,
            graphic_file: graphic_file,
            graphic_id: graphic_id,
            icon_folder: icon_folder,
            sof_dna: sof_dna,
            sof_fation_name: sof_fation_name,
            sof_hull_name: sof_hull_name,
            sof_race_name: sof_race_name
          }
        end

        def collision_file
          options["collision_file"]
        end

        def graphic_file
          options["graphic_file"]
        end

        def graphic_id
          options["graphic_id"]
        end

        def icon_folder
          options["icon_folder"]
        end

        def sof_dna
          options["sof_dna"]
        end

        def sof_fation_name
          options["sof_fation_name"]
        end

        def sof_hull_name
          options["sof_hull_name"]
        end

        def sof_race_name
          options["sof_race_name"]
        end
      end
    end
  end
end
