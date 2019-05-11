# frozen_string_literal: true

require 'spec_helper'

describe 'Get alliance icon' do
  context 'when etag not set' do
    let(:options) { { alliance_id: 99_005_443 } }

    before { VCR.insert_cassette 'esi/alliance_icon/99005443' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(icon_medium: 'http://imageserver.eveonline.com/Alliance/99005443_128.png',
                                    icon_small: 'http://imageserver.eveonline.com/Alliance/99005443_64.png')
    end

    specify { expect(subject.etag).to eq('7aea53dbbfb800b38d580e75af5b5e00e1946f3c14780b052f3f5154') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: '7aea53dbbfb800b38d580e75af5b5e00e1946f3c14780b052f3f5154'
      }
    end

    before { VCR.insert_cassette 'esi/alliance_icon/99005443_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceIcon.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('7aea53dbbfb800b38d580e75af5b5e00e1946f3c14780b052f3f5154') }
  end
end
