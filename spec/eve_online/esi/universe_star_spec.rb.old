# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseStar do
  let(:options) { {id: 40_000_001} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/stars/%<star_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(40_000_001) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Star) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Star) }

      before do
        #
        # EveOnline::ESI::Models::Star.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Star).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#age" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:age) }

    specify { expect { subject.age }.not_to raise_error }
  end

  describe "#luminosity" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:luminosity) }

    specify { expect { subject.luminosity }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#radius" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:radius) }

    specify { expect { subject.radius }.not_to raise_error }
  end

  describe "#solar_system_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:solar_system_id) }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#spectral_class" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:spectral_class) }

    specify { expect { subject.spectral_class }.not_to raise_error }
  end

  describe "#temperature" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:temperature) }

    specify { expect { subject.temperature }.not_to raise_error }
  end

  describe "#type_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Star) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:type_id) }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/stars/40000001/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/stars/40000001/")
    end
  end
end
