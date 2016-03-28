module EveOnline
  module CREST
    module Sovereignty
      # TODO: WTF? where docs???
      class Campaigns < Base
        API_ENDPOINT = 'https://public-crest.eveonline.com/sovereignty/campaigns/'

        def url
          API_ENDPOINT
        end
      end
    end
  end
end
