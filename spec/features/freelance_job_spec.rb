# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get freelance job details" do
  before { VCR.insert_cassette "esi/freelance_jobs/1f29f86d-1bae-4734-be0c-3e02a69d6846" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.freelance_jobs.retrieve(id: "1f29f86d-1bae-4734-be0c-3e02a69d6846") }

  specify do
    expect(subject.as_json).to eq(id: "1f29f86d-1bae-4734-be0c-3e02a69d6846",
      last_modified: Time.utc(2026, 9, 27, 22, 26, 47, 587_000),
      name: "ore mining job: mine/deliver any pyroxeres",
      state: "Active")
  end

  specify { expect(subject.progress.as_json).to eq(current: 64_437_858, desired: 110_000_000) }

  specify { expect(subject.reward.as_json).to eq(initial: 1_320_000_000, remaining: 546_745_704) }

  specify do
    expect(subject.details.as_json).to eq(career: "Industrialist",
      created: Time.utc(2026, 7, 27, 21, 9, 29, 970_000),
      description: "ore mining job: mine/deliver any pyroxeres QUICK &amp; EASY ISK",
      expires: Time.utc(2026, 10, 27, 21, 15, 0),
      finished: nil)
  end

  specify { expect(subject.details.creator.character.as_json).to eq(id: 2_123_319_233, name: "orioo") }

  specify { expect(subject.details.creator.corporation.as_json).to eq(id: 98_808_262, name: "INVISION HORIZON") }

  specify do
    expect(subject.contribution.as_json).to eq(contribution_per_participant_limit: nil,
      max_committed_participants: 10_000,
      reward_per_contribution: 12,
      submission_limit: nil,
      submission_multiplier: 1)
  end

  specify { expect(subject.access_and_visibility.as_json).to eq(acl_protected: false) }

  specify { expect(subject.access_and_visibility.broadcast_locations.size).to eq(10) }

  specify { expect(subject.access_and_visibility.broadcast_locations.first.as_json).to eq(id: 30_002_661, name: "Botane") }

  specify { expect(subject.configuration["method"]).to eq("DeliverItem") }
end
