# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseMoon do
  let(:options) { {id: 40_000_004} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/moons/%<moon_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(40_000_004) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

      before do
        #
        # EveOnline::ESI::Models::Moon.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Moon).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#moon_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:moon_id) }

    specify { expect { subject.moon_id }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#system_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:system_id) }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe "#position" do
    let(:model) { instance_double(EveOnline::ESI::Models::Moon) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:position) }

    specify { expect { subject.position }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/moons/40000004/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/moons/40000004/")
    end
  end
end
