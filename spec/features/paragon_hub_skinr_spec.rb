# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List Paragon Hub SKINR listings" do
  before { VCR.insert_cassette "esi/paragon_hub/skinr" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.paragon_hub.skinr(limit: 10) }

  specify { expect(subject.listings.size).to eq(10) }

  specify do
    expect(subject.listings.first.as_json).to eq(created: Time.utc(2026, 9, 27, 22, 1, 45),
      expires: Time.utc(2026, 12, 26, 22, 1, 45),
      id: "60d49f04-bf07-40c5-8027-02edf5b4ee5c",
      last_modified: Time.utc(2026, 9, 27, 22, 1, 45),
      price: {"plex" => 250},
      quantity: 4,
      seller_id: 2_123_588_459,
      skinr_id: "668aef3eef646471b6eed18ddcf191d78b51c2434d53c4bce9725c00ff7cfb60",
      state: "listed")
  end

  specify { expect(subject.cursor).to be_a(EveOnline::ESI::Models::ParagonHubSkinrCursor) }

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("paragon-hub") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(144) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
