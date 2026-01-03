# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationAssets do
  let(:options) { {token: "token123", corporation_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v5/corporations/%<corporation_id>s/assets/") }

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

  describe "#assets" do
    context "when @assets set" do
      let(:assets) { [instance_double(EveOnline::ESI::Models::Asset)] }

      before { subject.instance_variable_set(:@assets, assets) }

      specify { expect(subject.assets).to eq(assets) }
    end

    context "when @assets not set" do
      let(:asset) { instance_double(EveOnline::ESI::Models::Asset) }

      let(:response) do
        [
          {
            type_id: 2629,
            location_id: 60_008_674,
            location_type: "station",
            item_id: 1_006_604_012_678,
            location_flag: "Hangar",
            is_singleton: false,
            quantity: 16_156
          }
        ]
      end

      before do
        #
        # subject.response # => [{"type_id"=>2629, "location_id"=>60008674, "location_type"=>"station", "item_id"=>1006604012678, "location_flag"=>"Hangar", "is_singleton"=>false, "quantity"=>16156}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Asset.new(response.first) # => assets
        #
        expect(EveOnline::ESI::Models::Asset).to receive(:new).with(response.first).and_return(asset)
      end

      specify { expect(subject.assets).to eq([asset]) }

      specify { expect { subject.assets }.to change { subject.instance_variable_get(:@assets) }.from(nil).to([asset]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-assets.read_corporation_assets.v1") }
  end

  describe "#roles" do
    specify { expect(subject.roles).to eq(["Director"]) }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:page]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v5/corporations/12345678/assets/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq(page: 1)
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v5/corporations/12345678/assets/?page=1")
    end
  end
end
