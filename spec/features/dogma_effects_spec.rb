# frozen_string_literal: true

require "spec_helper"

describe "Get effects" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/dogma/effects" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::DogmaEffects.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.effect_ids.size).to eq(4166) }

    specify { expect(subject.effect_ids.first).to eq(4) }

    specify { expect(subject.etag).to eq("5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(19) }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/dogma/effects_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::DogmaEffects.new(etag: "5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(43) }
  end
end
