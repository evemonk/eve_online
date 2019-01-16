# frozen_string_literal: true

require 'spec_helper'

describe "List alliance's corporations" do
  context 'when etag not set' do
    let(:options) { { alliance_id: 99_005_443 } }

    before { VCR.insert_cassette 'esi/alliance_corporations/99005443' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.corporation_ids.size).to eq(70) }

    specify { expect(subject.corporation_ids.first).to eq(98_091_533) }

    specify { expect(subject.etag).to eq('9b6810d8ddbd9a13bb4ad09cf4bfefd9f29974bffd543eb30ce25132') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: '9b6810d8ddbd9a13bb4ad09cf4bfefd9f29974bffd543eb30ce25132'
      }
    end

    before { VCR.insert_cassette 'esi/alliance_corporations/99005443_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::AllianceCorporations.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('9b6810d8ddbd9a13bb4ad09cf4bfefd9f29974bffd543eb30ce25132') }
  end
end
