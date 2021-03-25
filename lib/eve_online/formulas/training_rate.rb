# frozen_string_literal: true

module EveOnline
  module Formulas
    class TrainingRate
      attr_reader :primary, :secondary

      def initialize(primary, secondary)
        @primary = primary
        @secondary = secondary
      end

      def rate
        primary + (secondary / 2.0)
      end
    end
  end
end
