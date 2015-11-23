# TODO: finish this
module EveOnline
  module Characters
    # http://wiki.eve-id.net/APIv2_Char_AssetList_XML
    class AssetList < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/AssetList.xml.aspx'
    end
  end
end
