# frozen_string_literal: true

require "spec_helper"

describe "Get attribute information" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/dogma/attributes/2" }

    after { VCR.eject_cassette }

    let(:options) { {id: 2} }

    subject { EveOnline::ESI::DogmaAttribute.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(attribute_id: 2,
                                    default_value: 0.0,
                                    description: "Boolean to store status of online effect",
                                    display_name: "",
                                    high_is_good: true,
                                    icon_id: nil,
                                    name: "isOnline",
                                    published: nil,
                                    stackable: true,
                                    unit_id: nil)
    end

    specify { expect(subject.etag).to eq("acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd") }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/dogma/attributes/2_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        id: 2,
        etag: "acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd"
      }
    end

    subject { EveOnline::ESI::DogmaAttribute.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("acc1e563574a55f79ebe4a2a99845dd6c28f4e412e11fd084b8485fd") }
  end
end
