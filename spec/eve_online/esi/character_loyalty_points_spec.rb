# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterLoyaltyPoints do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/loyalty/points/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:character_id) { should eq(12_345_678) }
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
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/loyalty/points/?datasource=tranquility')
    end
  end
end
