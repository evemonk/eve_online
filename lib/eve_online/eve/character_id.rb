require 'uri'

module EveOnline
  module Eve
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve_characterid/
    class CharacterID < Base
      API_ENDPOINT = 'https://api.eveonline.com/eve/CharacterID.xml.aspx'.freeze

      attr_reader :names

      def initialize(names)
        super()
        @names = names
      end

      def characters
        raise NotImplementedError
      end

      def names_list
        raise RuntimeError unless names.kind_of?(Array)

        @names_list ||= names.join(',')
      end

      def escaped_names_list
        @escaped_names_list ||= URI.escape(names_list)
      end

      def url
        "#{ API_ENDPOINT }?names=#{ escaped_names_list }"
      end
    end
  end
end
