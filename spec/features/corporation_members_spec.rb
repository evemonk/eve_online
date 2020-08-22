# frozen_string_literal: true

require "spec_helper"

describe "Get corporation members" do
  context "when etag not set" do
    let(:options) do
      {
        corporation_id: 98_565_696,
        token: "token123"
      }
    end

    before { VCR.insert_cassette "esi/corporation_members/98565696" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationMembers.new(options) }

    specify { expect(subject.scope).to eq("esi-corporations.read_corporation_membership.v1") }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.character_ids.size).to eq(118) }

    specify { expect(subject.character_ids.first).to eq(2_114_220_544) }

    specify { expect(subject.etag).to eq("6094aeb7f2c2754a7d1f210eed73f1f858042330852fac847a477a59") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(50) }
  end

  context "when etag is set" do
    let(:options) do
      {
        corporation_id: 98_565_696,
        token: "token123",
        etag: "6094aeb7f2c2754a7d1f210eed73f1f858042330852fac847a477a59"
      }
    end

    before { VCR.insert_cassette "esi/corporation_members/98565696_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CorporationMembers.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("6094aeb7f2c2754a7d1f210eed73f1f858042330852fac847a477a59") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(8) }
  end
end
