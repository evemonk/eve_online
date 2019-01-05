# frozen_string_literal: true

require 'spec_helper'

describe 'Get item group information' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/groups/450' }

    after { VCR.eject_cassette }

    let(:options) { { id: 450, language: 'en-us' } }

    subject { EveOnline::ESI::UniverseGroup.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq(category_id: 25,
                                    group_id: 450,
                                    name: 'Arkonor',
                                    published: true)
    end

    specify { expect(subject.type_ids.size).to eq(10) }

    specify { expect(subject.type_ids.first).to eq(22) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        id: 450,
        language: 'en-us',
        etag: 'e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b'
      }
    end

    before { VCR.insert_cassette 'esi/universe/groups/450_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseGroup.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('e3f6a76b4a1287f54966c6253f8f5d6ac6460bc43d47570331b43e0b') }
  end
end
