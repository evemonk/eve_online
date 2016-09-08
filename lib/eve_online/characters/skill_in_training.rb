module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_skillintraining.html
    class SkillInTraining < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/SkillInTraining.xml.aspx'.freeze

      ACCESS_MASK = 131_072

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def as_json
        {
          current_tq_time: current_tq_time,
          training_end_time: training_end_time,
          training_start_time: training_start_time,
          training_type_id: training_type_id,
          training_start_sp: training_start_sp,
          training_destination_sp: training_destination_sp,
          training_to_level: training_to_level,
          skill_in_training: skill_in_training
        }
      end

      def current_tq_time
        parse_datetime_with_timezone(result.fetch('currentTQTime'))
      end

      def training_end_time
        parse_datetime_with_timezone(result.fetch('trainingEndTime'))
      end

      def training_start_time
        parse_datetime_with_timezone(result.fetch('trainingStartTime'))
      end

      def training_type_id
        result.fetch('trainingTypeID').to_i
      end

      def training_start_sp
        result.fetch('trainingStartSP').to_i
      end

      def training_destination_sp
        result.fetch('trainingDestinationSP').to_i
      end

      def training_to_level
        result.fetch('trainingToLevel').to_i
      end

      def skill_in_training
        result.fetch('skillInTraining').to_i
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end
