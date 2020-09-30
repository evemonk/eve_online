# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseType do
  let(:options) { {id: 192} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v3/universe/types/%<type_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(192) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Type) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Type) }

      before do
        #
        # EveOnline::ESI::Models::Type.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Type).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#capacity" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:capacity) }

    specify { expect { subject.capacity }.not_to raise_error }
  end

  describe "#description" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:description) }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#graphic_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:graphic_id) }

    specify { expect { subject.graphic_id }.not_to raise_error }
  end

  describe "#group_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:group_id) }

    specify { expect { subject.group_id }.not_to raise_error }
  end

  describe "#icon_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:icon_id) }

    specify { expect { subject.icon_id }.not_to raise_error }
  end

  describe "#market_group_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:market_group_id) }

    specify { expect { subject.market_group_id }.not_to raise_error }
  end

  describe "#mass" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:mass) }

    specify { expect { subject.mass }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#packaged_volume" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:packaged_volume) }

    specify { expect { subject.packaged_volume }.not_to raise_error }
  end

  describe "#portion_size" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:portion_size) }

    specify { expect { subject.portion_size }.not_to raise_error }
  end

  describe "#published" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:published) }

    specify { expect { subject.published }.not_to raise_error }
  end

  describe "#radius" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:radius) }

    specify { expect { subject.radius }.not_to raise_error }
  end

  describe "#type_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:type_id) }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#volume" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:volume) }

    specify { expect { subject.volume }.not_to raise_error }
  end

  describe "#dogma_attributes" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:dogma_attributes) }

    specify { expect { subject.dogma_attributes }.not_to raise_error }
  end

  describe "#dogma_effects" do
    let(:model) { instance_double(EveOnline::ESI::Models::Type) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:dogma_effects) }

    specify { expect { subject.dogma_effects }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:language]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v3/universe/types/192/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(language: "en-us")
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v3/universe/types/192/?language=en-us")
    end
  end
end
