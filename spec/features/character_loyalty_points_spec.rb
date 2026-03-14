# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get loyalty points" do
  before { VCR.insert_cassette "esi/character_loyalty_points/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.loyalty.loyalty_points(id: 1_337_512_245) }

  specify { expect(subject.size).to eq(7) }

  specify { expect(subject.first.as_json).to eq(corporation_id: 1_000_035, loyalty_points: 14_163) }

  specify { expect(subject.etag).to eq("\"b73336c59d7d5577a2e1b97e28b35d6ad62ef80c4d75e184069a5bf9\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("0595f020-3d23-4e4a-98a0-7ecab8beb738") }

  specify { expect(subject.ratelimit_group).to eq("char-wallet") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(141) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
