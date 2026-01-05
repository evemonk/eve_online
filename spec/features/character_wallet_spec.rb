# frozen_string_literal: true

require "spec_helper"

describe "Get a character's wallet balance" do
  before { VCR.insert_cassette "esi/character_wallet/1337512245_new" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.wallet.character(id: 1_337_512_245) }

  specify { expect(subject.wallet).to eq(3_378_103.44) }

  specify { expect(subject.etag).to eq('"d74e40a60c72a9a4b77e7c11c327e910e618de260e4b7621e9cbe4a9"') }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("4c548b49-277d-4e10-99f7-bf81dad30828") }

  specify { expect(subject.ratelimit_group).to eq("char-wallet") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(148) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
