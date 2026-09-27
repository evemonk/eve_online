# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get a military campaign objective" do
  before { VCR.insert_cassette "esi/military_campaigns/7519d7db-1e95-4d0e-bbbe-c47cd47de3c0/objectives/36fe563a-bc80-4c86-94a4-114358a8912b" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject do
    client.military_campaigns.objective(id: "7519d7db-1e95-4d0e-bbbe-c47cd47de3c0",
      objective_id: "36fe563a-bc80-4c86-94a4-114358a8912b")
  end

  specify do
    expect(subject.as_json).to eq(finished: nil,
      id: "36fe563a-bc80-4c86-94a4-114358a8912b",
      last_modified: Time.utc(2026, 9, 27, 19, 20, 14, 400_000),
      progress: 6634,
      started: Time.utc(2026, 8, 20, 16, 0, 3, 61_000),
      state: "Active")
  end

  specify { expect(subject.participants.as_json).to eq(committed: 1078, contributors: 854, total: 1181) }
end
