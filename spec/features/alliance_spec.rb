# frozen_string_literal: true

require "spec_helper"

describe "Get alliance information" do
  context "when etag not set" do
    let(:options) { {alliance_id: 99_005_443} }

    before { VCR.insert_cassette "esi/alliances/99005443" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliance.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq(name: "Kids With Guns Alliance",
                                    creator_id: 94_195_096,
                                    creator_corporation_id: 98_306_624,
                                    ticker: "-KWG-",
                                    date_founded: "2015-05-03T19:45:17Z",
                                    executor_corporation_id: 98_306_624,
                                    faction_id: nil)
    end

    specify { expect(subject.etag).to eq("6780e53a01c7d9715b5f445126c4f2c137da4be79e4debe541ce3ab2") }
  end

  context "when etag is set" do
    let(:options) do
      {
        alliance_id: 99_005_443,
        etag: "6780e53a01c7d9715b5f445126c4f2c137da4be79e4debe541ce3ab2"
      }
    end

    before { VCR.insert_cassette "esi/alliances/99005443_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Alliance.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("6780e53a01c7d9715b5f445126c4f2c137da4be79e4debe541ce3ab2") }
  end
end
