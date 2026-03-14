# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get corporation history" do
  before { VCR.insert_cassette "esi/character_corporation_history/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.corporation_history(id: 1_337_512_245) }

  specify { expect(subject.size).to eq(11) }

  specify do
    expect(subject.first.as_json).to eq(corporation_id: 1_000_171,
      is_deleted: nil,
      record_id: 64_489_559,
      start_date: Time.utc(2025, 4, 24, 19, 2, 0))
  end

  specify { expect(subject.etag).to eq("\"2101d3bfd27c5a53d0b90b07761e5716010bb393493110c3266cd730\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("3aff0c93-867f-4671-9cd5-bfec95b4bf43") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end
