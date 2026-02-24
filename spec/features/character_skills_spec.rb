# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character skills" do
  before { VCR.insert_cassette "esi/character_skills/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.skills.skills(character_id: 1_337_512_245) }

  specify { expect(subject.skills.size).to eq(241) }

  specify { expect(subject.etag).to eq("W/\"e7b3fa8814e0332e4425a39a5c21975f332ddb0b87e7205a3dd525358084485a\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(596) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
