# frozen_string_literal: true

require "spec_helper"

describe "Get wallet transactions" do
  context "when from_id not set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123"
      }
    end

    before { VCR.insert_cassette "esi/character_wallet_transactions/1337512245" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWalletTransactions.new(options) }

    specify { expect(subject.scope).to eq("esi-wallet.read_character_wallet.v1") }

    specify { expect(subject.wallet_transactions.size).to eq(47) }

    specify do
      expect(subject.wallet_transactions.first.as_json).to eq(client_id: 2116253203,
        date: "2020-03-08T11:49:16Z",
        is_buy: true,
        is_personal: true,
        journal_ref_id: 17740411474,
        location_id: 60008494,
        quantity: 1,
        transaction_id: 5296927639,
        type_id: 3538,
        unit_price: 99887.79)
    end

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(48) }
  end

  context "when from_id is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        from_id: 5278248796
      }
    end

    before { VCR.insert_cassette "esi/character_wallet_transactions/1337512245_with_from_id" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWalletTransactions.new(options) }

    specify { expect(subject.scope).to eq("esi-wallet.read_character_wallet.v1") }

    specify { expect(subject.wallet_transactions.size).to eq(1) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(7) }
  end
end
