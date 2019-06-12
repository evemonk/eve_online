# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CorporationLoyaltyStoreOffers do
  let(:options) { { corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v1/loyalty/stores/%<corporation_id>s/offers/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:corporation_id) { should eq(12_345_678) }
  end

  # def offers
  #   @offers ||=
  #       begin
  #         output = []
  #         response.each do |offer|
  #           output << Models::LoyaltyStoreOffer.new(offer)
  #         end
  #         output
  #       end
  # end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#roles' do
    specify { expect(subject.roles).to eq([]) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/loyalty/stores/12345678/offers/?datasource=tranquility')
    end
  end
end
