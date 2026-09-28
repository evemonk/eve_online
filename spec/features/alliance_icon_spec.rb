# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get alliance icon" do
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

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("eb0f3e3b-728b-407e-8eea-030bf9d0ce9c") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(48) }
end
