# frozen_string_literal: true

require "spec_helper"

describe "Get system jumps" do
  before { VCR.insert_cassette "esi/universe/system_jumps" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseSystemJumps.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.system_jumps.size).to eq(4979) }

  specify do
    expect(subject.system_jumps.first.as_json).to eq(ship_jumps: 65,
      system_id: 30_002_671)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(6) }
end
