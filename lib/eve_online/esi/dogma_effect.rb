# frozen_string_literal: true

require "forwardable"

module EveOnline
  module ESI
    class DogmaEffect < Base
      extend Forwardable

      API_PATH = "/v2/dogma/effects/%<effect_id>s/"

      attr_reader :id

      def initialize(options)
        super

        @id = options.fetch(:id)
      end

      def_delegators :model, :as_json, :description, :disallow_auto_repeat,
        :discharge_attribute_id, :display_name, :duration_attribute_id,
        :effect_category, :effect_id, :electronic_chance,
        :falloff_attribute_id, :icon_id, :is_assistance, :is_offensive,
        :is_warp_safe, :name, :post_expression, :pre_expression, :published,
        :range_attribute_id, :range_chance, :tracking_speed_attribute_id,
        :modifiers

      def model
        @model ||= Models::DogmaEffect.new(response)
      end

      def scope
      end

      def path
        format(API_PATH, effect_id: id)
      end
    end
  end
end
