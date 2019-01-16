# frozen_string_literal: true

require 'spec_helper'

describe 'Get graphic information' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/graphics/20481' }

    after { VCR.eject_cassette }

    let(:options) { { id: 20_481 } }

    subject { EveOnline::ESI::UniverseGraphic.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(collision_file: nil,
                                    graphic_file: nil,
                                    graphic_id: 20_481,
                                    icon_folder: nil,
                                    sof_dna: 'ai1_t1:tash-murkon:amarr',
                                    sof_fation_name: 'tash-murkon',
                                    sof_hull_name: 'ai1_t1',
                                    sof_race_name: 'amarr')
    end

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/graphics/20481_with_etag' }

    after { VCR.eject_cassette }

    let(:options) do
      {
        id: 20_481,
        etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b'
      }
    end

    subject { EveOnline::ESI::UniverseGraphic.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end
