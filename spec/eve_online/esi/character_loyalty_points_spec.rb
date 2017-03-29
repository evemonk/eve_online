require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::CharacterLoyaltyPoints do
  let(:token) { 'token123' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(token, character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%s/loyalty/points/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(token) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#loyalty_points' do
    let(:loyalty_point) { double }

    let(:response) do
      [
        {
          'corporation_id' => 1_000_035,
          'loyalty_points' => 14_163
        }
      ]
    end

    before do
      #
      # subject.response # => [{"corporation_id"=>1000035, "loyalty_points"=>14163}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::LoyaltyPoint.new(response.first) # => loyalty_point
      #
      expect(EveOnline::ESI::Models::LoyaltyPoint).to receive(:new).with(response.first).and_return(loyalty_point)
    end

    specify { expect(subject.loyalty_points).to eq([loyalty_point]) }

    specify { expect { subject.loyalty_points }.to change { subject.instance_variable_defined?(:@_memoized_loyalty_points) }.from(false).to(true) }
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
