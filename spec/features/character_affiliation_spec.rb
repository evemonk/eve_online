# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Character affiliation" do
  before { VCR.insert_cassette "esi/characters/affiliation" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.affiliation(ids: [1_337_512_245]) }

  specify { expect(subject.size).to eq(1) }

  specify do
    expect(subject.first.as_json).to eq(alliance_id: nil,
      character_id: 1_337_512_245,
      corporation_id: 1_000_171,
      faction_id: nil)
  end

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("adea71ff-d1c9-4b3c-92ae-adc0348b9f58") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }
end
