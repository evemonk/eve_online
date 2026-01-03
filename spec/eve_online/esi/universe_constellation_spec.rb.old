# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseConstellation do
  let(:options) { {id: 20_000_001} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/constellations/%<constellation_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(20_000_001) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

      before do
        #
        # EveOnline::ESI::Models::Constellation.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Constellation).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#constellation_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:constellation_id) }

    specify { expect { subject.constellation_id }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#region_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:region_id) }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe "#system_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:system_ids) }

    specify { expect { subject.system_ids }.not_to raise_error }
  end

  describe "#position" do
    let(:model) { instance_double(EveOnline::ESI::Models::Constellation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:position) }

    specify { expect { subject.position }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:language]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/constellations/20000001/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(language: "en-us")
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/constellations/20000001/?language=en-us")
    end
  end
end
