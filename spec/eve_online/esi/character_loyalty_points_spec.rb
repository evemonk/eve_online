require 'spec_helper'

describe EveOnline::ESI::CharacterLoyaltyPoints do
  let(:token) { 'token123' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(token, character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/loyalty/points/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(token) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-characters.read_loyalty.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
