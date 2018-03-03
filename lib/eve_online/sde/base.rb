# frozen_string_literal: true

require 'memoist'

module EveOnline
  module SDE
    class Base
      extend Memoist

      attr_reader :file

      def initialize(file)
        @file = file
      end

      def content
        File.read(file)
      end
      memoize :content

      def data
        YAML.safe_load(content)
      end
      memoize :data
    end
  end
end
