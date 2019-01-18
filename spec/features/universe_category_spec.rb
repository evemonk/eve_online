# frozen_string_literal: true

require 'spec_helper'

describe 'Get item category information' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/categories/6' }

    after { VCR.eject_cassette }

    let(:options) { { id: 6 } }

    subject { EveOnline::ESI::UniverseCategory.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(category_id: 6,
                                    name: 'Ship',
                                    published: true)
    end

    specify { expect(subject.group_ids.size).to eq(46) }

    specify { expect(subject.group_ids.first).to eq(25) }

    specify { expect(subject.etag).to eq('5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/categories/6_with_etag' }

    after { VCR.eject_cassette }

    let(:options) do
      {
        id: 6,
        etag: '5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2'
      }
    end

    subject { EveOnline::ESI::UniverseCategory.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2') }
  end
end
