# frozen_string_literal: true

module EveOnline
  module SDE
    module Models
      class InvFlag
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            flag_id: flag_id,
            flag_name: flag_name,
            flag_text: flag_text,
            order_id: order_id
          }
        end

        def flag_id
          data['flagID']
        end

        def flag_name
          data['flagName']
        end

        def flag_text
          data['flagText']
        end

        def order_id
          data['orderID']
        end
      end
    end
  end
end
