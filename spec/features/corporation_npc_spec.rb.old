# frozen_string_literal: true

require "spec_helper"

describe "Get npc corporations" do
  before { VCR.insert_cassette "esi/corporation_npc" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CorporationNPC.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.corporation_npc_ids.size).to eq(262) }

  specify { expect(subject.corporation_npc_ids.first).to eq(1_000_001) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(4) }
end
