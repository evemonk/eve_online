# frozen_string_literal: true

require "spec_helper"

describe "Get attributes" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/dogma/attributes" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::DogmaAttributes.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.attribute_ids.size).to eq(2463) }

    specify { expect(subject.attribute_ids.first).to eq(2) }

    specify { expect(subject.etag).to eq("5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/dogma/attributes_with_etag" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::DogmaAttributes.new(etag: "5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("5c9218218aca123ef8c106f6607bfe8e6e086d2fc2b972bbd8ff03d2") }
  end
end
