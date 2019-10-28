# frozen_string_literal: true

require 'spec_helper'

describe 'Get war information' do
  context 'when etag not set' do
    let(:options) { { id: 615_578 } }

    before { VCR.insert_cassette 'esi/wars/615578' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::War.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(declared: '2018-09-14 10:42:03.000000000 +0000',
                                    finished: '2018-09-20 03:52:00.000000000 +0000',
                                    mutual: false,
                                    open_for_allies: false,
                                    retracted: nil,
                                    started: '2018-09-14 10:42:03.000000000 +0000',
                                    war_id: 615_578)
    end

    specify { expect(subject.etag).to eq('3933b0baeaac259101f55fdad865c5590deeb9e1613fb2344b3db293') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        id: 615_578,
        etag: '3933b0baeaac259101f55fdad865c5590deeb9e1613fb2344b3db293'
      }
    end

    before { VCR.insert_cassette 'esi/wars/615578_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::War.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('3933b0baeaac259101f55fdad865c5590deeb9e1613fb2344b3db293') }
  end
end
