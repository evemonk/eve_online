# frozen_string_literal: true

require 'spec_helper'

describe 'Get planet information' do
  before { VCR.insert_cassette 'esi/universe/planet/40000002' }

  after { VCR.eject_cassette }

  let(:options) { { id: 40_000_002 } }

  subject { EveOnline::ESI::UniversePlanet.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(name: 'Tanoo I',
                                  planet_id: 40_000_002,
                                  system_id: 30_000_001,
                                  type_id: 11)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 161891117336.0,
                                           y: 21288951986.0,
                                           z: -73529712226.0)
  end
end
