# frozen_string_literal: true

require "spec_helper"

describe "Get mail labels and unread counts" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/mail/labels_and_unread_counts" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        character_id: 90_729_314,
        token: "token123"
      }
    end

    subject { EveOnline::ESI::CharacterMailLabels.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq("esi-mail.read_mail.v1") }

    specify { expect(subject.total_unread_count).to eq(1) }

    specify { expect(subject.labels.size).to eq(4) }

    specify do
      expect(subject.labels.last.as_json).to eq(color: "#ffffff",
        label_id: 8,
        name: "[Alliance]",
        unread_count: 0)
    end

    specify { expect(subject.etag).to eq("6aac63dafa81b592eba22fe0d7bf12a2c11bfd5b054aa78d3a3a5cde") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/mail/labels_and_unread_counts_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        character_id: 90_729_314,
        token: "token123",
        etag: "6aac63dafa81b592eba22fe0d7bf12a2c11bfd5b054aa78d3a3a5cde"
      }
    end

    subject { EveOnline::ESI::CharacterMailLabels.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("6aac63dafa81b592eba22fe0d7bf12a2c11bfd5b054aa78d3a3a5cde") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(37) }
  end
end
