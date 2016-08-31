module EveOnline
  module Characters
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_industryjobs.html
    class IndustryJobs < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/IndustryJobs.xml.aspx'.freeze

      attr_reader :key_id, :v_code, :character_id

      def initialize(key_id, v_code, character_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
      end

      def access_mask
        128
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end
