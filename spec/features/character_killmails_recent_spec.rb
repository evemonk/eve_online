# frozen_string_literal: true

require "spec_helper"

describe "Get a character's recent kills and losses" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: "token123",
      page: 1
    }
  end

  before { VCR.insert_cassette "esi/character_killmails/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterKillmailsRecent.new(options) }

  specify { expect(subject.scope).to eq("esi-killmails.read_killmails.v1") }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.killmails.size).to eq(4) }

  specify do
    expect(subject.killmails.first.as_json).to eq(killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387",
      killmail_id: 81_646_519)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(40) }
end
