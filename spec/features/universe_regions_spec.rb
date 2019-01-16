# frozen_string_literal: true

require 'spec_helper'

describe 'Get regions' do
  context 'when etag empty' do
    before { VCR.insert_cassette 'esi/universe/regions' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseRegions.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.universe_region_ids.size).to eq(106) }

    specify { expect(subject.universe_region_ids.first).to eq(10_000_001) }

    specify { expect(subject.etag).to eq('5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2') }
  end
end
