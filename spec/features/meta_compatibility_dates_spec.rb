# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get compatibility dates" do
  before { VCR.insert_cassette "esi/meta/compatibility_dates" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.meta.compatibility_dates }

  specify { expect(subject.as_json[:compatibility_dates]).to include("2020-01-01") }

  specify { expect(subject.as_json[:compatibility_dates].first).to eq("2026-08-18") }

  specify { expect(subject.ratelimit_group).to eq("meta") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }
end
