# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get system kills" do
  before { VCR.insert_cassette "esi/universe/system_kills" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.system_kills }

  specify { expect(subject.size).to eq(2852) }

  specify { expect(subject.first.as_json).to eq(npc_kills: 55, pod_kills: 0, ship_kills: 0, system_id: 30_001_342) }
end
