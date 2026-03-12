# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get constellations" do
  before { VCR.insert_cassette "esi/universe/constellations" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.constellations }

  specify { expect(subject.constellation_ids.size).to eq(1_184) }

  specify { expect(subject.constellation_ids.first).to eq(20_000_001) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("bc09871c-d037-48df-8775-154949309929") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(54) }
end
