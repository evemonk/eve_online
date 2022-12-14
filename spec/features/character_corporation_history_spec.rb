# frozen_string_literal: true

require "spec_helper"

describe "Get corporation history" do
  let(:options) { {character_id: 90_729_314} }

  before { VCR.insert_cassette "esi/character_corporation_history/90729314" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterCorporationHistory.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.entries.size).to eq(1) }

  specify do
    expect(subject.entries.first.as_json).to eq(corporation_id: 1_000_168,
      is_deleted: nil,
      record_id: 16_785_803,
      start_date: "2011-05-10T10:23:00Z")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end
