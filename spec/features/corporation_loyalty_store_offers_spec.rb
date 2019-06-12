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

    # specify do
    #   expect(subject.as_json).to eq(corporation_id: 98_134_807,
    #                                 birthday: '2010-01-15T15:26:00Z',
    #                                 name: 'Johnn Dillinger',
    #                                 gender: 'male',
    #                                 race_id: 2,
    #                                 bloodline_id: 4,
    #                                 description: '',
    #                                 alliance_id: 99_005_443,
    #                                 ancestry_id: 24,
    #                                 security_status: 1.8694881661345457,
    #                                 faction_id: nil,
    #                                 title: nil)
    # end

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
