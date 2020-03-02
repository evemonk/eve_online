# frozen_string_literal: true

require "spec_helper"

describe "List wars" do
  context "without max_war_id" do
    context "when etag not set" do
      before { VCR.insert_cassette "esi/wars/wars" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::Wars.new }

      specify { expect(subject.scope).to eq(nil) }

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.war_ids.size).to eq(2000) }

      specify { expect(subject.war_ids.first).to eq(629_019) }

      specify { expect(subject.etag).to eq("1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046") }
    end

    context "when etag is set" do
      before { VCR.insert_cassette "esi/wars/wars_with_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::Wars.new(etag: "1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046") }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("1e90be747fd163e5d74ab7a949bf8ad3f1d6ecd365cac31c534ab046") }
    end
  end

  context "with max_war_id" do
    context "when etag not set" do
      before { VCR.insert_cassette "esi/wars/wars_with_max_war_id" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::Wars.new(max_war_id: 10) }

      specify { expect(subject.not_modified?).to eq(false) }

      specify { expect(subject.war_ids.size).to eq(9) }

      specify { expect(subject.war_ids.first).to eq(9) }

      specify { expect(subject.etag).to eq("f1c28227847464613c1cb82dfc8a8c859b7b6857fad2c2a54c562812") }
    end

    context "when etag is set" do
      let(:options) do
        {
          max_war_id: 10,
          etag: "f1c28227847464613c1cb82dfc8a8c859b7b6857fad2c2a54c562812"
        }
      end

      before { VCR.insert_cassette "esi/wars/wars_with_max_war_id_and_etag" }

      after { VCR.eject_cassette }

      subject { EveOnline::ESI::Wars.new(options) }

      specify { expect(subject.not_modified?).to eq(true) }

      specify { expect(subject.etag).to eq("f1c28227847464613c1cb82dfc8a8c859b7b6857fad2c2a54c562812") }
    end
  end
end
