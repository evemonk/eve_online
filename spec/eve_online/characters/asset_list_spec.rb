require 'spec_helper'

describe EveOnline::Characters::AssetList do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12345678 }

  let(:flat) { 0 }

  subject { described_class.new(key_id, v_code, character_id, flat) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/AssetList.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }

    its(:flat) { should eq(flat) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }")
    end
  end
end
