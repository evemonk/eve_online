# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get route between two systems" do
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

    specify { expect(subject.cache_status).to eq(nil) }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3598) }

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

    specify { expect(subject.etag).to eq(nil) }

    specify { expect(subject.cache_status).to eq(nil) }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3596) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  context "with preference" do
    before { VCR.insert_cassette "esi/routes/preference" }

    after { VCR.eject_cassette }

    let(:jita_system_id) { 30_000_142 }

    let(:amarr_system_id) { 30_002_187 }

    let(:preference) { "Safer" }

    let(:jita_to_amarr) do
      [
        30_000_142, 30_000_144, 30_000_139, 30_002_802, 30_002_801,
        30_002_803, 30_002_768, 30_002_765, 30_002_764, 30_002_761,
        30_004_972, 30_004_970, 30_002_633, 30_002_634, 30_002_641,
        30_002_681, 30_002_682, 30_002_048, 30_002_049, 30_002_053,
        30_002_543, 30_002_545, 30_002_568, 30_002_529, 30_002_530,
        30_002_507, 30_002_509, 30_000_004, 30_000_005, 30_000_002,
        30_002_973, 30_002_969, 30_002_974, 30_002_972, 30_002_971,
        30_002_970, 30_002_963, 30_002_964, 30_002_991, 30_002_994,
        30_003_545, 30_003_548, 30_003_525, 30_003_523, 30_003_522,
        30_002_187
      ]
    end

    subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id, preference: preference) }

    specify { expect(subject.route).to eq(jita_to_amarr) }

    specify { expect(subject.etag).to eq(nil) }

    specify { expect(subject.cache_status).to eq(nil) }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3594) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  context "with avoid_systems" do
    before { VCR.insert_cassette "esi/routes/avoid_systems" }

    after { VCR.eject_cassette }

    let(:jita_system_id) { 30_000_142 }

    let(:amarr_system_id) { 30_002_187 }

    let(:avoid_systems_ids) { [30_005_196] }

    let(:jita_to_amarr) do
      [
        30_000_142, 30_000_144, 30_002_642, 30_002_643, 30_002_644,
        30_002_691, 30_002_718, 30_002_719, 30_002_720, 30_002_050,
        30_002_051, 30_002_060, 30_002_066, 30_002_099, 30_002_517,
        30_002_537, 30_002_542, 30_003_068, 30_003_067, 30_003_065,
        30_003_520, 30_003_521, 30_003_522, 30_002_187
      ]
    end

    subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id, avoid_systems_ids: avoid_systems_ids) }

    specify { expect(subject.route).to eq(jita_to_amarr) }

    specify { expect(subject.etag).to eq(nil) }

    specify { expect(subject.cache_status).to eq(nil) }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3592) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end

  context "with connections" do
    before { VCR.insert_cassette "esi/routes/connections" }

    after { VCR.eject_cassette }

    let(:jita_system_id) { 30_000_142 }

    let(:amarr_system_id) { 30_002_187 }

    let(:connections) { [{from: 30_000_142, to: 30_002_187}] }

    let(:jita_to_amarr) do
      [
        30_000_142, 30_002_187
      ]
    end

    subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id, connections: connections) }

    specify { expect(subject.route).to eq(jita_to_amarr) }

    specify { expect(subject.etag).to eq(nil) }

    specify { expect(subject.cache_status).to eq(nil) }

    specify { expect(subject.request_id).to eq(nil) }

    specify { expect(subject.ratelimit_group).to eq("routes") }

    specify { expect(subject.ratelimit_limit).to eq("3600/15m") }

    specify { expect(subject.ratelimit_remaining).to eq(3590) }

    specify { expect(subject.ratelimit_used).to eq(2) }

    specify { expect(subject.error_limit_remain).to eq(nil) }

    specify { expect(subject.error_limit_reset).to eq(nil) }
  end
end
