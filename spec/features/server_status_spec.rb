# frozen_string_literal: true

require "spec_helper"

describe "Retrieve the uptime and player counts" do
  before { VCR.insert_cassette "esi/server_status" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::ServerStatus.new }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(players: 29_653,
      server_version: "2776971",
      start_time: "2025-01-02T11:01:17Z",
      vip: nil)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end
