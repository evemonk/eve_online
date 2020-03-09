# frozen_string_literal: true

require "spec_helper"

describe "Get character wallet journal" do
  context "when etag not set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        page: 1
      }
    end

    before { VCR.insert_cassette "esi/character_wallet_journal/1337512245" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWalletJournal.new(options) }

    specify { expect(subject.scope).to eq("esi-wallet.read_character_wallet.v1") }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.page).to eq(1) }

    specify { expect(subject.total_pages).to eq(1) }

    specify { expect(subject.wallet_journal_entries.size).to eq(220) }

    specify do
      expect(subject.wallet_journal_entries.first.as_json).to eq(amount: 87375.0,
                                                                 balance: 2405126.01,
                                                                 context_id: 30003498,
                                                                 context_id_type: "system_id",
                                                                 date: "2020-03-08T12:08:25Z",
                                                                 description: "Johnn Dillinger got bounty prizes for killing pirates in Sharhelund",
                                                                 first_party_id: 1000125,
                                                                 id: 17740466914,
                                                                 reason: "3744: 2,3748: 2,18085: 2,18070: 1",
                                                                 ref_type: "bounty_prizes",
                                                                 second_party_id: 1337512245,
                                                                 tax: nil,
                                                                 tax_receiver_id: nil)
    end

    specify { expect(subject.etag).to eq("b618a1a584f6aad53cb79c72d6de26d8c9210d0a18be1421d5355446") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(59) }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        page: 1,
        etag: "b618a1a584f6aad53cb79c72d6de26d8c9210d0a18be1421d5355446"
      }
    end

    before { VCR.insert_cassette "esi/character_wallet_journal/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWalletJournal.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("b618a1a584f6aad53cb79c72d6de26d8c9210d0a18be1421d5355446") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(12) }
  end
end
