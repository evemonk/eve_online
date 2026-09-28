# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get alliance history" do
  before { VCR.insert_cassette "esi/corporations/98468592/alliancehistory" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.alliance_history(id: 98_468_592) }

  specify { expect(subject.size).to eq(7) }

  specify do
    expect(subject.first.as_json).to eq(alliance_id: nil,
      is_deleted: nil,
      record_id: 1_543_401,
      start_date: Time.utc(2025, 1, 20, 8, 27, 0))
  end

  specify { expect(subject.etag).to eq("\"ad91220f38b3a2dac2b4f83c4eb3b03dd02e11fc846652ca1abffe43\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("9df1d0bd-1be8-47d6-aefa-5fb1d393702e") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(55) }
end
