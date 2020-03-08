# frozen_string_literal: true

require "spec_helper"

describe "Get a single killmail" do
  context "when etag not set" do
    let(:options) do
      {
        killmail_id: 81_646_519,
        killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387"
      }
    end

    before { VCR.insert_cassette "esi/killmail/81646519/8f1450fca8ce97be9b10e106a1257088407ef387" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Killmail.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq(nil) }

    specify do
      expect(subject.as_json).to eq({})
    end

    specify { expect(subject.etag).to eq("4e09692ec8bf793011f2dc457a0b0224ec7b86f0f448b2fbcaca0160") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(48) }
  end

  context "when etag is set" do
    let(:options) do
      {
        killmail_id: 81_646_519,
        killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387",
        etag: "4e09692ec8bf793011f2dc457a0b0224ec7b86f0f448b2fbcaca0160"
      }
    end

    before { VCR.insert_cassette "esi/killmail/81646519/8f1450fca8ce97be9b10e106a1257088407ef387_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Killmail.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("4e09692ec8bf793011f2dc457a0b0224ec7b86f0f448b2fbcaca0160") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(48) }
  end
end
