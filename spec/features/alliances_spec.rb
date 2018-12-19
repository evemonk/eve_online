# frozen_string_literal: true

require 'spec_helper'

describe 'List all active player alliances' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/alliances' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliances.new }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.alliance_ids.size).to eq(3028) }

    specify { expect(subject.alliance_ids.first).to eq(1_354_830_081) }

    specify { expect(subject.current_etag).to eq('97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/alliances_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliances.new(etag: '97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.current_etag).to eq('97f0c48679f2b200043cdbc3406291fc945bcd652ddc7fc11ccdc37a') }
  end
end
