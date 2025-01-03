# frozen_string_literal: true

require "spec_helper"

describe "Get corporation history" do
  let(:options) { {character_id: 1_337_512_245} }

  before { VCR.insert_cassette "esi/character_corporation_history/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterCorporationHistory.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.entries.size).to eq(10) }

  specify do
    expect(subject.entries.first.as_json).to eq(corporation_id: 98_565_696,
      is_deleted: nil,
      record_id: 52_535_738,
      start_date: "2020-04-24T17:23:00Z")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(41) }
end
