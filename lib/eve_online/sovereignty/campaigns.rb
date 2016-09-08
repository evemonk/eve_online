module EveOnline
  module Sovereignty
    # TODO: WTF? where docs???
    # https://developers.eveonline.com/blog/article/aegis-sovereignty-api-changes
    class Campaigns < BaseCREST
      API_ENDPOINT = 'https://crest-tq.eveonline.com/sovereignty/campaigns/'.freeze

      # TODO: return array of objects
      def items
        response.fetch('items')
      end

      # TODO: recheck this and maybe remove as unneeded
      def page_count
        response.fetch('pageCount')
      end

      # TODO: recheck this and maybe remove as unneeded
      def total_count
        response.fetch('totalCount')
      end

      def url
        API_ENDPOINT
      end
    end
  end
end
