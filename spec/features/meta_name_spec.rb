# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get ESI name" do
  before { VCR.insert_cassette "esi/meta/name" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.meta.name }

  specify { expect(subject.as_json[:current]).to eq("EVE SKINR Ingenuity (ESI)") }

  specify { expect(subject.as_json[:history].first).to eq("date" => "2026-08-18", "name" => "EVE SKINR Ingenuity (ESI)") }

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("meta") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(130) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
