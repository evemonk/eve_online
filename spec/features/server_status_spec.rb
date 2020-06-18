# frozen_string_literal: true

require "spec_helper"

describe "Retrieve the uptime and player counts" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/server_status" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::ServerStatus.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(players: 20_450,
                                    server_version: "1446360",
                                    start_time: "2019-01-17T11:05:44Z",
                                    vip: nil)
    end

    specify { expect(subject.etag).to eq("c2f41ae833fceb5533627552f494d071e34d4e4a2183589a6b9c85e1") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(2) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/server_status_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::ServerStatus.new(etag: "c2f41ae833fceb5533627552f494d071e34d4e4a2183589a6b9c85e1") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("c2f41ae833fceb5533627552f494d071e34d4e4a2183589a6b9c85e1") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(2) }
  end
end
