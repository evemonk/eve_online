# frozen_string_literal: true

require 'spec_helper'

describe 'Get graphics' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/graphics' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseGraphics.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.graphic_ids.size).to eq(3_702) }

    specify { expect(subject.graphic_ids.first).to eq(20_480) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/graphics_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseGraphics.new(etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end
