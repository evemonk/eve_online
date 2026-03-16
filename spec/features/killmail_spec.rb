# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get a single killmail" do
  before { VCR.insert_cassette "esi/killmail/81646519/8f1450fca8ce97be9b10e106a1257088407ef387" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.killmails.killmail(killmail_id: 81_646_519, killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387") }

  specify do
    expect(subject.as_json).to eq(killmail_id: 81_646_519,
      killmail_time: Time.utc(2020, 2, 14, 23, 25, 7),
      moon_id: nil,
      solar_system_id: 30003493,
      war_id: nil)
  end

  specify { expect(subject.etag).to eq("\"4e09692ec8bf793011f2dc457a0b0224ec7b86f0f448b2fbcaca0160\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("938d9abb-bcdf-4ff4-bd4d-4140ef222cc6") }

  specify { expect(subject.ratelimit_group).to eq("killmail") }

  specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(3_596) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
