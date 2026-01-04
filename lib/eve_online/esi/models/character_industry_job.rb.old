# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      class CharacterIndustryJob < Base
        def as_json
          {
            activity_id: activity_id,
            blueprint_id: blueprint_id,
            blueprint_location_id: blueprint_location_id,
            blueprint_type_id: blueprint_type_id,
            completed_character_id: completed_character_id,
            completed_date: completed_date,
            cost: cost,
            duration: duration,
            end_date: end_date,
            facility_id: facility_id,
            installer_id: installer_id,
            job_id: job_id,
            licensed_runs: licensed_runs,
            output_location_id: output_location_id,
            pause_date: pause_date,
            probability: probability,
            product_type_id: product_type_id,
            runs: runs,
            start_date: start_date,
            station_id: station_id,
            status: status,
            successful_runs: successful_runs
          }
        end

        def activity_id
          options["activity_id"]
        end

        def blueprint_id
          options["blueprint_id"]
        end

        def blueprint_location_id
          options["blueprint_location_id"]
        end

        def blueprint_type_id
          options["blueprint_type_id"]
        end

        def completed_character_id
          options["completed_character_id"]
        end

        def completed_date
          completed_date = options["completed_date"]

          parse_datetime_with_timezone(completed_date) if completed_date
        end

        def cost
          options["cost"]
        end

        def duration
          options["duration"]
        end

        def end_date
          end_date = options["end_date"]

          parse_datetime_with_timezone(end_date) if end_date
        end

        def facility_id
          options["facility_id"]
        end

        def installer_id
          options["installer_id"]
        end

        def job_id
          options["job_id"]
        end

        def licensed_runs
          options["licensed_runs"]
        end

        def output_location_id
          options["output_location_id"]
        end

        def pause_date
          pause_date = options["pause_date"]

          parse_datetime_with_timezone(pause_date) if pause_date
        end

        def probability
          options["probability"]
        end

        def product_type_id
          options["product_type_id"]
        end

        def runs
          options["runs"]
        end

        def start_date
          start_date = options["start_date"]

          parse_datetime_with_timezone(start_date) if start_date
        end

        def station_id
          options["station_id"]
        end

        def status
          options["status"]
        end

        def successful_runs
          options["successful_runs"]
        end
      end
    end
  end
end
