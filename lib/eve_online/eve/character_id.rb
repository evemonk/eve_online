module EveOnline
  module Eve
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_characterid/
    class CharacterID < Base
      API_ENDPOINT = 'https://api.eveonline.com/eve/CharacterID.xml.aspx'.freeze

      def url
        API_ENDPOINT
      end
    end
  end
end
