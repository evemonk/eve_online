require 'spec_helper'

describe EveOnline::ESI::Characters::Character do
  let(:character_id) { 12_345_678 }

  subject { described_class.new(character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/?datasource=tranquility') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
