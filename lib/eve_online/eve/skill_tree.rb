module EveOnline
  module Eve
    # http://wiki.eve-id.net/APIv2_Eve_SkillTree_XML
    class SkillTree < Base
      API_ENDPOINT = 'https://api.eveonline.com/eve/SkillTree.xml.aspx'.freeze

      def url
        API_ENDPOINT
      end
    end
  end
end
