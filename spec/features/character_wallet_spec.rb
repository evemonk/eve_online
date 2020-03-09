# frozen_string_literal: true

require "spec_helper"

describe "Get a character's wallet balance" do
  context "when etag not set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        page: 1
      }
    end

    before { VCR.insert_cassette "esi/character_wallet/1337512245" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWallet.new(options) }

    specify { expect(subject.scope).to eq("esi-wallet.read_character_wallet.v1") }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.wallet).to eq(2405126.0) }

    specify { expect(subject.etag).to eq("482786a491138fdf393f42c457424b0cd3f3c3c7c2c9afb3f55c618a") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(47) }
  end

  context "when etag is set" do
    let(:options) do
      {
        character_id: 1_337_512_245,
        token: "token123",
        page: 1,
        etag: "482786a491138fdf393f42c457424b0cd3f3c3c7c2c9afb3f55c618a"
      }
    end

    before { VCR.insert_cassette "esi/character_wallet/1337512245_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterWallet.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("482786a491138fdf393f42c457424b0cd3f3c3c7c2c9afb3f55c618a") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(12) }
  end
end
