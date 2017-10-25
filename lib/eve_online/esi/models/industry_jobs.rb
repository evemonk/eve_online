module EveOnline
  module ESI
    module Models
      class IndustryJobs < Base
        # get_characters_character_id_industry_jobs_ok [
        #   get_characters_character_id_industry_jobs_200_ok
        # ]
        # get_characters_character_id_industry_jobs_200_ok {
        #   activity_id (integer): Job activity ID ,
        #   blueprint_id (integer): blueprint_id integer ,
        #   blueprint_location_id (integer): Location ID of the location from which the blueprint was installed. Normally a station ID, but can also be an asset (e.g. container) or corporation facility ,
        #   blueprint_type_id (integer): blueprint_type_id integer ,
        #   completed_character_id (integer, optional): ID of the character which completed this job ,
        #   completed_date (string, optional): Date and time when this job was completed ,
        #   cost (number, optional): The sume of job installation fee and industry facility tax ,
        #   duration (integer): Job duration in seconds ,
        #   end_date (string): Date and time when this job finished ,
        #   facility_id (integer): ID of the facility where this job is running ,
        #   installer_id (integer): ID of the character which installed this job ,
        #   job_id (integer): Unique job ID ,
        #   licensed_runs (integer, optional): Number of runs blueprint is licensed for ,
        #   output_location_id (integer): Location ID of the location to which the output of the job will be delivered. Normally a station ID, but can also be a corporation facility ,
        #   pause_date (string, optional): Date and time when this job was paused (i.e. time when the facility where this job was installed went offline) ,
        #   probability (number, optional): Chance of success for invention ,
        #   product_type_id (integer, optional): Type ID of product (manufactured, copied or invented) ,
        #   runs (integer): Number of runs for a manufacturing job, or number of copies to make for a blueprint copy ,
        #   start_date (string): Date and time when this job started ,
        #   station_id (integer): ID of the station where industry facility is located ,
        #   status (string): status string = ['active', 'paused', 'ready', 'delivered', 'cancelled', 'reverted'],
        #   successful_runs (integer, optional): Number of successful runs for this job. Equal to runs unless this is an invention job
        # }
        def as_json
          {
            activity_id: activity_id,
            blueprint_id: blueprint_id,
            blueprint_location_id: blueprint_location_id,
            blueprint_type_id: blueprint_type_id,
            cost: cost,
            duration: duration,
            end_date: end_date,
            facility_id: facility_id,
            installer_id: installer_id,
            job_id: job_id,
            licensed_runs: licensed_runs,
            output_location_id: output_location_id,
            runs: runs,
            start_date: start_date,
            station_id: station_id,
            status: status            
          }
        end

        def activity_id
          options['activity_id']
        end

        def blueprint_id
          options['blueprint_id']
        end

        def blueprint_location_id
          options['blueprint_location_id']
        end

        def blueprint_type_id
          options['blueprint_type_id']
        end

        def cost
          options['cost']          
        end

        def duration
          options['duration']
        end

        def end_date
          end_date = options['end_date']

          parse_datetime_with_timezone(end_date) if end_date
        end

        def facility_id
          options['facility_id']
        end

        def installer_id
          options['installer_id']
        end

        def job_id
          options['job_id']
        end

        def licensed_runs
          options['licensed_runs']
        end

        def output_location_id
          options['output_location_id']
        end

        def runs
          options['runs']
        end

        def start_date
          end_date = options['start_date']

          parse_datetime_with_timezone(start_date) if start_date
        end

        def station_id
          options['station_id']
        end

        def status
          options['status']
        end
      end
    end
  end
end
