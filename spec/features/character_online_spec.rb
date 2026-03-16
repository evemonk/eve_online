# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character online" do
  before { VCR.insert_cassette "esi/location/online" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.locations.online(id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(last_login: Time.utc(2022, 12, 17, 1, 36, 16),
      last_logout: Time.utc(2022, 12, 17, 1, 37, 11),
      logins: 536,
      online: false)
  end

  specify { expect(subject.etag).to eq("\"436c2ab6639a5b647761178846e3446a4dc7ea92ec5dad648a7503a7\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("a5f7587c-2e98-4956-b429-c0981725eb01") }

  specify { expect(subject.ratelimit_group).to eq("char-location") }

  specify { expect(subject.ratelimit_limit).to eq("1200/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(1197) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
