# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get factions at war" do
  before { VCR.insert_cassette "esi/faction_warfare/wars" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.faction_warfare.wars }

  specify { expect(subject.size).to eq(12) }

  specify { expect(subject.first.as_json).to eq(against_id: 500_004, faction_id: 500_001) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("d9965df7-0fe0-4d97-8e93-492377ff6fec") }

  specify { expect(subject.ratelimit_group).to eq("factional-warfare") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(126) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
