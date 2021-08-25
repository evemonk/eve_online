# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Search do
  let(:options) { {search: "Jita", strict: false} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/search/") }

  specify do
    expect(described_class::DEFAULT_CATEGORIES).to eq([
      "agent",
      "alliance",
      "character",
      "constellation",
      "corporation",
      "faction",
      "inventory_type",
      "region",
      "solar_system",
      "station"
    ])
  end

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq(nil) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:strict) { should eq(false) }

      its(:search) { should eq("Jita") }

      its(:raw_categories) { should eq(described_class::DEFAULT_CATEGORIES) }

      its(:categories) { should eq("agent,alliance,character,constellation,corporation,faction,inventory_type,region,solar_system,station") }
    end

    context "with options" do
      let(:options) { {search: "Jita", categories: ["solar_system", "station"], strict: true} }

      its(:token) { should eq(nil) }

      its(:strict) { should eq(true) }

      its(:search) { should eq("Jita") }

      its(:raw_categories) { should eq(["solar_system", "station"]) }

      its(:categories) { should eq("solar_system,station") }
    end

    context "with wrong category" do
      let(:options) { {search: "Jita", categories: ["anything"]} }

      specify { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::Search) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::Search) }

      before do
        #
        # EveOnline::ESI::Models::Search.new(response) # => model
        #
        expect(EveOnline::ESI::Models::Search).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#agent_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:agent_ids) }

    specify { expect { subject.agent_ids }.not_to raise_error }
  end

  describe "#alliance_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:alliance_ids) }

    specify { expect { subject.alliance_ids }.not_to raise_error }
  end

  describe "#character_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:character_ids) }

    specify { expect { subject.character_ids }.not_to raise_error }
  end

  describe "#constellation_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:constellation_ids) }

    specify { expect { subject.constellation_ids }.not_to raise_error }
  end

  describe "#corporation_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:corporation_ids) }

    specify { expect { subject.corporation_ids }.not_to raise_error }
  end

  describe "#faction_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:faction_ids) }

    specify { expect { subject.faction_ids }.not_to raise_error }
  end

  describe "#inventory_type_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:inventory_type_ids) }

    specify { expect { subject.inventory_type_ids }.not_to raise_error }
  end

  describe "#region_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:region_ids) }

    specify { expect { subject.region_ids }.not_to raise_error }
  end

  describe "#solar_system_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:solar_system_ids) }

    specify { expect { subject.solar_system_ids }.not_to raise_error }
  end

  describe "#station_ids" do
    let(:model) { instance_double(EveOnline::ESI::Models::Search) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:station_ids) }

    specify { expect { subject.station_ids }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:search, :categories, :strict]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/search/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(
        search: "Jita",
        categories: "agent,alliance,character,constellation,corporation,faction,inventory_type,region,solar_system,station",
        strict: false
      )
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/search/?categories=agent%2Calliance%2Ccharacter%2Cconstellation%2Ccorporation%2Cfaction%2Cinventory_type%2Cregion%2Csolar_system%2Cstation&search=Jita&strict=false")
    end
  end
end
