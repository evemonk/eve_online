# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character attributes" do
  before { VCR.insert_cassette "esi/character_attributes/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.skills.attributes(character_id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(
      accrued_remap_cooldown_date: Time.utc(2012, 5, 6, 12, 58, 6),
      bonus_remaps: 2,
      charisma: 20,
      intelligence: 24,
      last_remap_date: Time.utc(2011, 5, 7, 12, 58, 6),
      memory: 24,
      perception: 23,
      willpower: 23
    )
  end

  specify { expect(subject.etag).to eq("\"ce95d94263dca861a2b1503c111d2b1086d56affc06bbcc959303011\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("3f149302-ea44-45c3-8ded-9f0820bf5ed1") }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
