# frozen_string_literal: true

module EveOnline
  module ESI
    module Models
      module ModelWithEtag
        def etag
          options['etag']
        end
      end
    end
  end
end
