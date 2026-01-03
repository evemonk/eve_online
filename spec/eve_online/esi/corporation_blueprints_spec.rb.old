# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationBlueprints do
  let(:options) { {token: "token123", corporation_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/corporations/%<corporation_id>s/blueprints/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:corporation_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context "with options" do
      let(:options) { {token: "token123", corporation_id: 12_345_678, page: 10} }

      its(:page) { should eq(10) }
    end
  end

  describe "#blueprints" do
    context "when @blueprints set" do
      let(:blueprints) { [instance_double(EveOnline::ESI::Models::Blueprint)] }

      before { subject.instance_variable_set(:@blueprints, blueprints) }

      specify { expect(subject.blueprints).to eq(blueprints) }
    end

    context "when @blueprints not set" do
      let(:blueprint) { instance_double(EveOnline::ESI::Models::Blueprint) }

      let(:response) do
        [
          {
            item_id: 1_000_000_010_495,
            type_id: 691,
            location_id: 60_014_719,
            location_flag: "CorpSAG1",
            quantity: 1,
            time_efficiency: 0,
            material_efficiency: 0,
            runs: -1
          }
        ]
      end

      before do
        #
        # subject.response # => [{"item_id"=>1000000010495, "type_id"=>691, "location_id"=>60014719, "location_flag"=>"CorpSAG1", "quantity"=>1, "time_efficiency"=>0, "material_efficiency"=>0, "runs"=>-1}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Blueprint.new(response.first) # => blueprint
        #
        expect(EveOnline::ESI::Models::Blueprint).to receive(:new).with(response.first).and_return(blueprint)
      end

      specify { expect(subject.blueprints).to eq([blueprint]) }

      specify { expect { subject.blueprints }.to change { subject.instance_variable_get(:@blueprints) }.from(nil).to([blueprint]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-corporations.read_blueprints.v1") }
  end

  describe "#roles" do
    specify { expect(subject.roles).to eq(["Director"]) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:page]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/corporations/12345678/blueprints/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/corporations/12345678/blueprints/?page=1")
    end
  end
end
