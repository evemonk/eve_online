# frozen_string_literal: true

require "spec_helper"

describe "Get alliance icon" do
  before { VCR.insert_cassette "esi/alliance_icon/99008595" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.icons(id: 99_008_595) }

  specify do
    expect(subject.as_json).to eq(
      icon_medium: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=128",
      icon_small: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=64"
    )
  end

  specify { expect(subject.etag).to eq('"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b"') }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("bf2c1384-ddd0-4d07-b53e-ccdfd2cfce4f") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(12) }
end
