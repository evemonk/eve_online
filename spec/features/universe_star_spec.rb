# frozen_string_literal: true

require "spec_helper"

describe "Get star information" do
  context "when etag empty" do
    before { VCR.insert_cassette "esi/universe/stars/40000001" }

    after { VCR.eject_cassette }

    let(:options) { {id: 40_000_001} }

    subject { EveOnline::ESI::UniverseStar.new(options) }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify do
      expect(subject.as_json).to eq(age: 14_262_808_228,
                                    luminosity: 0.01575000025331974,
                                    name: "Tanoo - Star",
                                    radius: 126_700_000,
                                    solar_system_id: 30_000_001,
                                    spectral_class: "K2 V",
                                    temperature: 4567,
                                    type_id: 45_041)
    end

    specify { expect(subject.etag).to eq("2e28835f91024608719726b655591d531125a023e122859d174923d5") }
  end

  context "when etag present" do
    before { VCR.insert_cassette "esi/universe/stars/40000001_with_etag" }

    after { VCR.eject_cassette }

    let(:options) { {id: 40_000_001, etag: "2e28835f91024608719726b655591d531125a023e122859d174923d5"} }

    subject { EveOnline::ESI::UniverseStar.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("2e28835f91024608719726b655591d531125a023e122859d174923d5") }
  end
end
