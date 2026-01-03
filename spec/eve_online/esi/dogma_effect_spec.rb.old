# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::DogmaEffect do
  let(:options) { {id: 596} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/dogma/effects/%<effect_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(596) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

      before do
        #
        # EveOnline::ESI::Models::DogmaEffect.new(response) # => model
        #
        expect(EveOnline::ESI::Models::DogmaEffect).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#description" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#disallow_auto_repeat" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:disallow_auto_repeat) }

    specify { expect { subject.disallow_auto_repeat }.not_to raise_error }
  end

  describe "#discharge_attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:discharge_attribute_id) }

    specify { expect { subject.discharge_attribute_id }.not_to raise_error }
  end

  describe "#display_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:display_name) }

    specify { expect { subject.display_name }.not_to raise_error }
  end

  describe "#duration_attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:duration_attribute_id) }

    specify { expect { subject.duration_attribute_id }.not_to raise_error }
  end

  describe "#effect_category" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:effect_category) }

    specify { expect { subject.effect_category }.not_to raise_error }
  end

  describe "#effect_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:effect_id) }

    specify { expect { subject.effect_id }.not_to raise_error }
  end

  describe "#electronic_chance" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:electronic_chance) }

    specify { expect { subject.electronic_chance }.not_to raise_error }
  end

  describe "#falloff_attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:falloff_attribute_id) }

    specify { expect { subject.falloff_attribute_id }.not_to raise_error }
  end

  describe "#icon_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_id) }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#is_assistance" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:is_assistance) }

    specify { expect { subject.is_assistance }.not_to raise_error }
  end

  describe "#is_offensive" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:is_offensive) }

    specify { expect { subject.is_offensive }.not_to raise_error }
  end

  describe "#is_warp_safe" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:is_warp_safe) }

    specify { expect { subject.is_warp_safe }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#post_expression" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:post_expression) }

    specify { expect { subject.post_expression }.not_to raise_error }
  end

  describe "#pre_expression" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:pre_expression) }

    specify { expect { subject.pre_expression }.not_to raise_error }
  end

  describe "#published" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:published) }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#range_attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:range_attribute_id) }

    specify { expect { subject.range_attribute_id }.not_to raise_error }
  end

  describe "#range_chance" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:range_chance) }

    specify { expect { subject.range_chance }.not_to raise_error }
  end

  describe "#tracking_speed_attribute_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:tracking_speed_attribute_id) }

    specify { expect { subject.tracking_speed_attribute_id }.not_to raise_error }
  end

  describe "#modifiers" do
    let(:model) { instance_double(EveOnline::ESI::Models::DogmaEffect) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:modifiers) }

    specify { expect { subject.modifiers }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/dogma/effects/596/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/dogma/effects/596/")
    end
  end
end
