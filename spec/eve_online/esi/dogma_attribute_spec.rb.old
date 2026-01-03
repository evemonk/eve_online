# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::DogmaAttribute do
  let(:options) { {id: 2} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/dogma/attributes/%<attribute_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(2) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

      before do
        #
        # EveOnline::ESI::Models::DogmaAttribute.new(response) # => model
        #
        expect(EveOnline::ESI::Models::DogmaAttribute).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:attribute_id) }

    specify { expect { subject.attribute_id }.not_to raise_error }
  end

  describe "#default_value" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:default_value) }

    specify { expect { subject.default_value }.not_to raise_error }
  end

  describe "#description" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#display_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:display_name) }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe "#high_is_good" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:high_is_good) }

    specify { expect { subject.high_is_good }.not_to raise_error }
  end

  describe "#icon_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_id) }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#published" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:published) }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#stackable" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:stackable) }

    specify { expect { subject.stackable }.not_to raise_error }
  end

  describe "#unit_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaAttribute) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:unit_id) }

    specify { expect { subject.unit_id }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/dogma/attributes/2/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/dogma/attributes/2/")
    end
  end
end
