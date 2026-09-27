# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Character affiliation" do
  before { VCR.insert_cassette "esi/characters/affiliation" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.affiliation(ids: [1_337_512_245]) }

  specify { expect(subject.size).to eq(1) }

  specify do
    expect(subject.first.as_json).to eq(alliance_id: nil,
      character_id: 1_337_512_245,
      corporation_id: 1_000_171,
      faction_id: nil)
  end
end
