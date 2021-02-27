# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseStation do
  let(:options) { {id: 60_012_526} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/universe/stations/%<station_id>s/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:id) { should eq(60_012_526) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Station) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Station) }

      before do
        #
        # EveOnline::ESI::Models::Station.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Station).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#max_dockable_ship_volume" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:max_dockable_ship_volume) }

    specify { expect { subject.max_dockable_ship_volume }.not_to raise_error }
  end

  describe "#name" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:name) }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#office_rental_cost" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:office_rental_cost) }

    specify { expect { subject.office_rental_cost }.not_to raise_error }
  end

  describe "#owner" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:owner) }

    specify { expect { subject.owner }.not_to raise_error }
  end

  describe "#race_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:race_id) }

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe "#reprocessing_efficiency" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:reprocessing_efficiency) }

    specify { expect { subject.reprocessing_efficiency }.not_to raise_error }
  end

  describe "#reprocessing_stations_take" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:reprocessing_stations_take) }

    specify { expect { subject.reprocessing_stations_take }.not_to raise_error }
  end

  describe "#services" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:services) }

    specify { expect { subject.services }.not_to raise_error }
  end

  describe "#station_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:station_id) }

    specify { expect { subject.station_id }.not_to raise_error }
  end

  describe "#system_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:system_id) }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe "#type_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:type_id) }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#position" do
    let(:model) { instance_double(EveOnline::ESI::Models::Station) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:position) }

    specify { expect { subject.position }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/universe/stations/60012526/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/universe/stations/60012526/")
    end
  end
end
