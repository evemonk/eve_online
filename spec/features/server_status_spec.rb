# frozen_string_literal: true

require "spec_helper"

describe "Retrieve the uptime and player counts" do
  before { VCR.insert_cassette "esi/server_status/info" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.server_status.info }

  specify do
    expect(subject.as_json).to eq(players: 20_450,
      server_version: "1446360",
      start_time: "2019-01-17T11:05:44Z",
      vip: nil)
  end

  specify { expect(subject.request_id).to eq("aaedbec2-945b-4141-8a39-245b84a8a841") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }
end
