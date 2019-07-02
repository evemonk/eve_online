# frozen_string_literal: true

require 'spec_helper'

describe 'List all public structures' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/structures' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseStructures.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.structure_ids.size).to eq(3654) }

    specify { expect(subject.structure_ids.first).to eq(1_027_528_548_355) }

    specify { expect(subject.etag).to eq('1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/structures_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseStructures.new(etag: '1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('1b64f9a8268bb3ba350acc7d7116bfd75dd9f88defb1bbc61771aec7') }
  end
end
