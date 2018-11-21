# frozen_string_literal: true

module EveOnline
  module ESI
    module ResponseWithEtag
      def response_with_etag
        @response_with_etag ||= response.merge('etag' => current_etag)
      end
    end
  end
end
