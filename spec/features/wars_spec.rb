# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List wars" do
  context "without max_war_id" do
    before { VCR.insert_cassette "esi/wars/wars" }

    after { VCR.eject_cassette }

    let(:client) { EveOnline::ESI::Client.new }

    subject { client.wars.wars }

    specify { expect(subject.war_ids.size).to eq(2000) }

    specify { expect(subject.war_ids.first).to eq(757_791) }

    specify { expect(subject.etag).to eq("\"de54c528bec6b397ab60e7fee885474cdde2bc07910a7abd854b4d8b\"") }

    specify { expect(subject.cache_status).to eq("HIT") }

    specify { expect(subject.request_id).to eq("2dab7a84-3ea9-4968-85dd-ea2bc729dfe0") }

    specify { expect(subject.ratelimit_group).to eq("killmail") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3_596) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  # context "with max_war_id" do
  #   before { VCR.insert_cassette "esi/wars/wars_with_max_war_id" }
  #
  #   after { VCR.eject_cassette }
  #
  #   subject { EveOnline::ESI::Wars.new(max_war_id: 10) }
  #
  #   specify { expect(subject.war_ids.size).to eq(9) }
  #
  #   specify { expect(subject.war_ids.first).to eq(9) }
  #
  #   specify { expect(subject.error_limit_remain).to eq(100) }
  #
  #   specify { expect(subject.error_limit_reset).to eq(56) }
  # end
end
