# frozen_string_literal: true

require 'spec_helper'

describe 'List wars' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/wars/wars' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Wars.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.war_ids.size).to eq(2000) }

    specify { expect(subject.war_ids.first).to eq(629_019) }

    specify { expect(subject.etag).to eq('1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/wars/wars_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Wars.new(etag: '1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046') }
  end
end
