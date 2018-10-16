# frozen_string_literal: true

require 'spec_helper'

describe 'Get asteroid belt information' do
  before { VCR.insert_cassette 'esi/universe/asteroid_belt/40000003' }

  after { VCR.eject_cassette }

  let(:options) { { id: 40_000_003 } }

  subject { EveOnline::ESI::UniverseAsteroidBelt.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(name: 'Tanoo I - Asteroid Belt 1',
                                  system_id: 30_000_001)
  end

  specify do
    expect(subject.position.as_json).to eq(x: 161967513600.0,
                                           y: 21288837120.0,
                                           z: -73505464320.0)
  end
end
