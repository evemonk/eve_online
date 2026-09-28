# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List kills for a war" do
  before { VCR.insert_cassette "esi/wars/744979/killmails" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.wars.killmails(war_id: 744_979) }

  specify { expect(subject.size).to eq(3) }

  specify do
    expect(subject.first.as_json).to eq(killmail_hash: "aa7ef390212e3fd470924b0db8532c15710749e2",
      killmail_id: 121_385_936)
  end

  specify { expect(subject.etag).to eq("\"b0be26525b74bbb088b5b0369b596beae3fd48525c24e4093708ccb1\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("1c9fba32-66b0-4633-a849-1dd7f9e699db") }

  specify { expect(subject.ratelimit_group).to eq("killmail") }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(3596) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
