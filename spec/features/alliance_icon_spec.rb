# frozen_string_literal: true

require 'spec_helper'

describe 'Get alliance icon' do
  context 'when etag not set' do
    let(:options) { { alliance_id: 99_005_443 } }

    before { VCR.insert_cassette 'esi/alliance_icon/99005443' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq(icon_medium: 'http://imageserver.eveonline.com/Alliance/99005443_128.png',
                                    icon_small: 'http://imageserver.eveonline.com/Alliance/99005443_64.png')
    end

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b'
      }
    end

    before { VCR.insert_cassette 'esi/alliance_icon/99005443_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end
