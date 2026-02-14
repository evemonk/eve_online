# frozen_string_literal: true

require "spec_helper"

describe "Get route between two systems" do
  let(:client) { EveOnline::ESI::Client.new }

  context "with defaults" do
    before { VCR.insert_cassette "esi/routes/defaults" }

    after { VCR.eject_cassette }

    let(:jita_system_id) { 30_000_142 }

    let(:amarr_system_id) { 30_002_187 }

    let(:jita_to_amarr) do
      [
        30_000_142,
        30_000_138,
        30_000_132,
        30_000_134,
        30_005_196,
        30_005_192,
        30_004_083,
        30_004_081,
        30_002_197,
        30_002_193,
        30_003_491,
        30_002_187
      ]
    end

    subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id) }

    specify { expect(subject.route).to eq(jita_to_amarr) }

    specify { expect(subject.etag).to eq(nil) }

    specify { expect(subject.cache_status).to eq("DYNAMIC") }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3591) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  context "when security_penalty set" do
    before { VCR.insert_cassette "esi/routes/security_penalty" }

    after { VCR.eject_cassette }

    let(:jita_system_id) { 30_000_142 }

    let(:amarr_system_id) { 30_002_187 }

    let(:security_penalty) { 0 }

    let(:jita_to_amarr) do
      [
        30_000_142,
        30_000_138,
        30_000_132,
        30_000_134,
        30_005_196,
        30_005_192,
        30_004_083,
        30_004_081,
        30_002_197,
        30_002_193,
        30_003_491,
        30_002_187
      ]
    end

    subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id, security_penalty: security_penalty) }

    specify { expect(subject.route).to eq(jita_to_amarr) }
  end
end
