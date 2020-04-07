# frozen_string_literal: true

module EveOnline
  module Formulas
    class BlueprintCopyTime
      attr_reader :seconds, :science_level, :advanced_industry_level,
        :science_copy_speed_bonus_per_level,
        :advanced_industry_skill_industry_job_time_bonus_per_level, :runs

      def initialize(seconds, science_level, advanced_industry_level,
                     science_copy_speed_bonus_per_level,
                     advanced_industry_skill_industry_job_time_bonus_per_level,
                     runs = 1)
        @seconds = seconds
        @science_level = science_level
        @advanced_industry_level = advanced_industry_level
        @science_copy_speed_bonus_per_level = science_copy_speed_bonus_per_level
        @advanced_industry_skill_industry_job_time_bonus_per_level = advanced_industry_skill_industry_job_time_bonus_per_level
        @runs = runs
      end

      def time
        (BigDecimal(seconds.to_s) * BigDecimal(time_modifier.to_s) * BigDecimal(runs.to_s)).to_f
      end

      def time_modifier
        science_copy_bonus_time_modifier * advanced_industry_job_time_bonus_time_modifier
      end

      def science_copy_bonus
        science_level * science_copy_speed_bonus_per_level
      end

      def science_copy_bonus_time_modifier
        (100.0 + science_copy_bonus) / 100.0
      end

      def advanced_industry_job_time_bonus
        advanced_industry_level * advanced_industry_skill_industry_job_time_bonus_per_level
      end

      def advanced_industry_job_time_bonus_time_modifier
        (100.0 + advanced_industry_job_time_bonus) / 100.0
      end
    end
  end
end
