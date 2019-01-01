# frozen_string_literal: true

require 'spec_helper'

describe 'Get system jumps' do
  context 'when etag not set' do
    before { VCR.insert_cassette 'esi/universe/system_jumps' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseSystemJumps.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.system_jumps.size).to eq(4979) }

    specify do
      expect(subject.system_jumps.first.as_json).to eq(ship_jumps: 65,
                                                       system_id: 30_002_671)
    end

    specify { expect(subject.etag).to eq('40d7cfcdb494669846bedf8adadc47002986d8f5529508e8d5f8f552') }
  end

  context 'when etag is set' do
    before { VCR.insert_cassette 'esi/universe/system_jumps_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::UniverseSystemJumps.new(etag: '40d7cfcdb494669846bedf8adadc47002986d8f5529508e8d5f8f552') }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('40d7cfcdb494669846bedf8adadc47002986d8f5529508e8d5f8f552') }
  end
end
