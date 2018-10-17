# frozen_string_literal: true

require 'spec_helper'

describe 'Get system kills' do
  before { VCR.insert_cassette 'esi/universe/system_kills' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseSystemKills.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.system_kills.size).to eq(3185) }

  specify do
    expect(subject.system_kills.first.as_json).to eq(npc_kills: 231,
                                                     pod_kills: 0,
                                                     ship_kills: 0,
                                                     system_id: 30_001_746)
  end
end
