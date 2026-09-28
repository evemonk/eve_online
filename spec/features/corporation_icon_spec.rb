# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get corporation icon" do
  before { VCR.insert_cassette "esi/corporations/98468592/icons" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.icons(id: 98_468_592) }

  specify do
    expect(subject.as_json).to eq(icon_large: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=256",
      icon_medium: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=128",
      icon_small: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=64")
  end

  specify { expect(subject.etag).to eq("\"619091a52cd82f4c2aa533f3db51b6961ff3f58f96dc5d4e0996d078\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("2305b84a-6750-43af-85fd-83fdef362d37") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(54) }
end
