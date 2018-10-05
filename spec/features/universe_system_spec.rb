# frozen_string_literal: true

require 'spec_helper'

describe 'Get solar system information' do
  before { VCR.insert_cassette 'esi/universe/system/30000001' }

  after { VCR.eject_cassette }

  let(:options) { { id: 30_000_001, language: 'en-us' } }

  subject { EveOnline::ESI::UniverseSystem.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(constellation_id: 20_000_001,
                                  name: 'Tanoo',
                                  security_class: 'B',
                                  security_status: 0.8583240509033203,
                                  star_id: 40_000_001,
                                  system_id: 30_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: -88510792599980580.0,
                                           y: 42369443966878880.0,
                                           z: -44513525346479660.0)
  end

  specify { expect(subject.planets).to eq(nil) }

  specify { expect(subject.stargate_ids).to eq([50000056, 50000057, 50000058]) }

  specify { expect(subject.station_ids).to eq([60012526, 60014437]) }
end
