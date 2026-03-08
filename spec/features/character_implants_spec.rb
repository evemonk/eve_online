# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get active implants" do
  before { VCR.insert_cassette "esi/character_implants/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.clones.implants(character_id: 1_337_512_245) }

  specify { expect(subject.implant_ids.size).to eq(5) }

  specify { expect(subject.implant_ids.first).to eq(9_899) }

  specify { expect(subject.etag).to eq("\"20c3b011ce6fe6cc4f7b9e4a7a90b7fa4f75963f3fe8367c0c7dbe2c\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("29db9926-2098-4ca3-8ba5-02516612b366") }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(598) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
