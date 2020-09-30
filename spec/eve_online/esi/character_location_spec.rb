# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterLocation do
  let(:options) { {character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/location/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

      before do
        #
        # EveOnline::ESI::Models::CharacterLocation.new(response) # => model
        #
        expect(EveOnline::ESI::Models::CharacterLocation).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#solar_system_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:solar_system_id) }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#station_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:station_id) }

    specify { expect { subject.station_id }.not_to raise_error }
  end

  describe "#structure_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::CharacterLocation) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:structure_id) }

    specify { expect { subject.structure_id }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-location.read_location.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/location/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/location/")
    end
  end
end
