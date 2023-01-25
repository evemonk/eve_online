# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationAssetsLocations do
  let(:options) { {token: "token123", corporation_id: 12_345_678, item_ids: [1_001_215_602_246]} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/corporations/%<corporation_id>s/assets/locations/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:corporation_id) { should eq(12_345_678) }

    its(:item_ids) { should eq([1_001_215_602_246]) }
  end

  describe "#assets_locations" do
    context "when @assets_locations set" do
      let(:assets_locations) { [instance_double(EveOnline::ESI::Models::AssetLocation)] }

      before { subject.instance_variable_set(:@assets_locations, assets_locations) }

      specify { expect(subject.assets_locations).to eq(assets_locations) }
    end

    context "when @assets_locations not set" do
      let(:asset_location) { instance_double(EveOnline::ESI::Models::AssetLocation) }

      let(:response) do
        [
          {
            item_id: 1_001_215_602_246,
            position: {
              x: -928_621_543_221.3319,
              y: 297_645_715_142.40234,
              z: -971_212_198_300.4812
            }
          }
        ]
      end

      before do
        #
        # subject.response # => [{"item_id"=>1001215602246, "position"=>{"x"=>-928621543221.3319, "y"=>297645715142.40234, "z"=>-971212198300.4812}}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::AssetLocation.new(response.first) # => asset_location
        #
        expect(EveOnline::ESI::Models::AssetLocation).to receive(:new).with(response.first).and_return(asset_location)
      end

      specify { expect(subject.assets_locations).to eq([asset_location]) }

      specify { expect { subject.assets_locations }.to change { subject.instance_variable_get(:@assets_locations) }.from(nil).to([asset_location]) }
    end
  end

  describe "#http_method" do
    specify { expect(subject.http_method).to eq(:post) }
  end

  describe "#payload" do
    let(:item_ids) { double }

    let(:options) { {corporation_id: 12_345_678, item_ids: item_ids} }

    before { expect(item_ids).to receive(:to_json) }

    specify { expect { subject.payload }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-assets.read_corporation_assets.v1") }
  end

  describe "#roles" do
    specify { expect(subject.roles).to eq(["Director"]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/corporations/12345678/assets/locations/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/corporations/12345678/assets/locations/")
    end
  end
end
