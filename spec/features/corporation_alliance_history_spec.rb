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

  specify do
    expect(subject.to_a[3].as_json).to eq(alliance_id: 99_007_916,
      is_deleted: true,
      record_id: 1_192_636,
      start_date: Time.utc(2018, 6, 1, 14, 55, 0))
  end
end
