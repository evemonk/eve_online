# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseGraphic do
  let(:options) { {id: 20_481} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/universe/graphics/%<graphic_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(20_481) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

      before do
        #
        # EveOnline::ESI::Models::Graphic.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Graphic).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#collision_file" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:collision_file) }

    specify { expect { subject.collision_file }.not_to raise_error }
  end

  describe "#graphic_file" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:graphic_file) }

    specify { expect { subject.graphic_file }.not_to raise_error }
  end

  describe "#graphic_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:graphic_id) }

    specify { expect { subject.graphic_id }.not_to raise_error }
  end

  describe "#icon_folder" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_folder) }

    specify { expect { subject.icon_folder }.not_to raise_error }
  end

  describe "#sof_dna" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:sof_dna) }

    specify { expect { subject.sof_dna }.not_to raise_error }
  end

  describe "#sof_fation_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:sof_fation_name) }

    specify { expect { subject.sof_fation_name }.not_to raise_error }
  end

  describe "#sof_hull_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:sof_hull_name) }

    specify { expect { subject.sof_hull_name }.not_to raise_error }
  end

  describe "#sof_race_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Graphic) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:sof_race_name) }

    specify { expect { subject.sof_race_name }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v1/universe/graphics/20481/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/universe/graphics/20481/")
    end
  end
end
