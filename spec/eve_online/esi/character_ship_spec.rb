# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterShip do
  let(:options) { {character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/ship/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

      before do
        #
        # EveOnline::ESI::Models::CharacterShip.new(response) # => model
        #
        expect(EveOnline::ESI::Models::CharacterShip).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#ship_item_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ship_item_id) }

    specify { expect { subject.ship_item_id }.not_to raise_error }
  end

  describe "#ship_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ship_name) }

    specify { expect { subject.ship_name }.not_to raise_error }
  end

  describe "#ship_type_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterShip) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:ship_type_id) }

    specify { expect { subject.ship_type_id }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-location.read_ship_type.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/ship/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/ship/")
    end
  end
end
