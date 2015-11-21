require 'spec_helper'

describe EveOnline::Character::AssetList do
  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/AssetList.xml.aspx') }
end
