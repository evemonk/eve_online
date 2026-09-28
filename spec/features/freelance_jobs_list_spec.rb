# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List freelance jobs" do
  before { VCR.insert_cassette "esi/freelance_jobs/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.freelance_jobs.list(limit: 10) }

  specify { expect(subject.freelance_jobs.size).to eq(10) }

  specify do
    job = subject.freelance_jobs.first

    expect(job.as_json).to eq(id: "c20b6835-6070-4fda-b377-aba7c25a39e6",
      last_modified: Time.utc(2026, 9, 27, 22, 27, 0, 892_000),
      name: "43 PLAG' BUYBACK",
      state: "Active")
  end

  specify do
    job = subject.freelance_jobs.first

    expect(job.progress.as_json).to eq(current: 2_152_070, desired: 4_000_000)
    expect(job.reward.as_json).to eq(initial: 108_000_000, remaining: 49_894_110)
  end

  specify { expect(subject.cursor).to be_a(EveOnline::ESI::Models::FreelanceJobsCursor) }

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("freelance-job") }

  specify { expect(subject.ratelimit_limit).to eq("12000/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(11990) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
