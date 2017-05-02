require 'spec_helper'

describe EveOnline::XML::CharacterPlanetaryRoutes do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  let(:planet_id) { 123_456 }

  subject { described_class.new(key_id, v_code, character_id, planet_id) }

  specify { expect(subject).to be_a(EveOnline::XML::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/PlanetaryRoutes.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(2) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }

    its(:planet_id) { should eq(planet_id) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&planetID=#{ planet_id }")
    end
  end
end
