# frozen_string_literal: true

require 'spec_helper'

describe 'List loyalty store offers' do
  context 'when etag not set' do
    let(:options) { { corporation_id: 1_000_035 } }

    before { VCR.insert_cassette 'esi/corporations_loyalty_store_offers/1000035' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationLoyaltyStoreOffers.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.offers.size).to eq(332) }

    specify do
      expect(subject.offers.first.as_json).to eq(ak_cost: nil,
                                                 isk_cost: 2_400_000,
                                                 lp_cost: 2_400,
                                                 offer_id: 3_584,
                                                 quantity: 5_000,
                                                 type_id: 23_047)
    end

    specify { expect(subject.etag).to eq('89211f42fde090e4d22621e9b97d7604ab87af95b3b6ffed7fe81bc0') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        corporation_id: 1_000_035,
        etag: '89211f42fde090e4d22621e9b97d7604ab87af95b3b6ffed7fe81bc0'
      }
    end

    before { VCR.insert_cassette 'esi/corporations_loyalty_store_offers/1000035_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationLoyaltyStoreOffers.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('89211f42fde090e4d22621e9b97d7604ab87af95b3b6ffed7fe81bc0') }
  end
end
