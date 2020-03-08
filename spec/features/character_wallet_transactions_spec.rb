# frozen_string_literal: true

require "spec_helper"

describe "Get wallet transactions" do
  context "when etag not set" do
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

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.wallet_transactions.size).to eq(47) }

      specify { expect(subject.etag).to eq("55d0fbe8b408d6a76dab70c0a709d4e7c5dd58d4e0b7bd785549e268") }

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

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.wallet_transactions.size).to eq(1) }

      specify { expect(subject.etag).to eq("b92fae885ba527533c0696e80bc5283600c3cb004e88651f9afea02d") }

      specify { expect(subject.error_limit_remain).to eq(100) }

      specify { expect(subject.error_limit_reset).to eq(7) }
    end
  end

  context "when etag is set" do
    context "when from_id not set" do
      let(:options) do
        {
          character_id: 1_337_512_245,
          token: "token123",
          etag: "55d0fbe8b408d6a76dab70c0a709d4e7c5dd58d4e0b7bd785549e268"
        }
      end

      before { VCR.insert_cassette "esi/character_wallet_transactions/1337512245_with_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::CharacterWalletTransactions.new(options) }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("55d0fbe8b408d6a76dab70c0a709d4e7c5dd58d4e0b7bd785549e268") }

      specify { expect(subject.error_limit_remain).to eq(100) }

      specify { expect(subject.error_limit_reset).to eq(49) }
    end

    context "when from_id is set" do
      let(:options) do
        {
          character_id: 1_337_512_245,
          token: "token123",
          etag: "b92fae885ba527533c0696e80bc5283600c3cb004e88651f9afea02d",
          from_id: 5278248796
        }
      end

      before { VCR.insert_cassette "esi/character_wallet_transactions/1337512245_with_from_id_with_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::CharacterWalletTransactions.new(options) }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("b92fae885ba527533c0696e80bc5283600c3cb004e88651f9afea02d") }

      specify { expect(subject.error_limit_remain).to eq(100) }

      specify { expect(subject.error_limit_reset).to eq(28) }
    end
  end
end
