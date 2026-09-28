# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get constellations" do
  before { VCR.insert_cassette "esi/universe/constellations" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.constellations }

  specify { expect(subject.constellation_ids.size).to eq(1_184) }

  specify { expect(subject.constellation_ids.first).to eq(20_000_001) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("d7cbb755-ab99-4e86-aca7-f2ca93de19cd") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(40) }
end
