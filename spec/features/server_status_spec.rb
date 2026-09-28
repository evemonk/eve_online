# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Retrieve the uptime and player counts" do
  before { VCR.insert_cassette "esi/server_status/info" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.server_status.info }

  specify do
    expect(subject.as_json).to eq(players: 26_717,
      server_version: "3552227",
      start_time: Time.utc(2026, 9, 28, 11, 5, 11),
      vip: false)
  end

  specify { expect(subject.etag).to eq('W/"d4e59a5f6c4a6914c9deb42063550a55588087ef7ab04a4dfecc01eddb5f2c73"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("status") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
