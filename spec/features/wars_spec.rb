# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List wars" do
  context "without max_war_id" do
    before { VCR.insert_cassette "esi/wars/wars" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.wars.wars }

    specify { expect(subject.war_ids.size).to eq(2000) }

    specify { expect(subject.war_ids.first).to eq(762_994) }

    specify { expect(subject.etag).to eq("\"9a79a432d011f49d22567bdb7e75ff509f945861faec589f96f97017\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("6674c8e5-bba5-41ab-8744-2c3b8b181a71") }

    specify { expect(subject.ratelimit_group).to eq("killmail") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3_596) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  context "with max_war_id" do
    before { VCR.insert_cassette "esi/wars/wars_with_max_war_id" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.wars.wars(max_war_id: 10) }

    specify { expect(subject.war_ids.size).to eq(9) }

    specify { expect(subject.war_ids.first).to eq(9) }

    specify { expect(subject.etag).to eq("\"f1c28227847464613c1cb82dfc8a8c859b7b6857fad2c2a54c562812\"") }

    specify { expect(subject.cache_status).to eq("MISS") }

    specify { expect(subject.request_id).to eq("91e80d2c-e411-4bc6-99e3-333897fba83f") }

    specify { expect(subject.ratelimit_group).to eq("killmail") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3594) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end
end
