# frozen_string_literal: true

require "spec_helper"

describe "Retrieve the uptime and player counts" do
  before { VCR.insert_cassette "esi/server_status" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::ServerStatus.new }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(players: 20_450,
      server_version: "1446360",
      start_time: "2019-01-17T11:05:44Z",
      vip: nil)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(2) }
end
