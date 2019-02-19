# frozen_string_literal: true

require 'spec_helper'

describe 'Get character assets' do
  context 'when etag not set' do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: 'token123',
        page: 1
      }
    end

    before { VCR.insert_cassette 'esi/character_assets/1337512245' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterAssets.new(options) }

    specify { expect(subject.scope).to eq('esi-assets.read_assets.v1') }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.page).to eq(1) }

    specify { expect(subject.total_pages).to eq(1) }

    specify { expect(subject.assets.size).to eq(487) }

    specify do
      expect(subject.assets.first.as_json).to eq(is_blueprint_copy: nil,
                                                 is_singleton: true,
                                                 item_id: 1_001_215_602_246,
                                                 location_flag: 'Hangar',
                                                 location_id: 60_008_674,
                                                 location_type: 'station',
                                                 quantity: 1,
                                                 type_id: 2998)
    end

    specify { expect(subject.etag).to eq('29da11b30974e55cd440a879199a629a8492a4c0a49894a2cd22f90b') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: 'token123',
        page: 1,
        etag: '29da11b30974e55cd440a879199a629a8492a4c0a49894a2cd22f90b'
      }
    end

    before { VCR.insert_cassette 'esi/character_assets/1337512245_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterAssets.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('29da11b30974e55cd440a879199a629a8492a4c0a49894a2cd22f90b') }
  end
end
