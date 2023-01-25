# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationAssetsNames do
  let(:options) { {token: "token123", corporation_id: 12_345_678, item_ids: [1_001_215_602_246]} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v1/corporations/%<corporation_id>s/assets/names/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:corporation_id) { should eq(12_345_678) }

    its(:item_ids) { should eq([1_001_215_602_246]) }
  end

  describe "#assets_names" do
    context "when @assets_names set" do
      let(:assets_names) { [instance_double(EveOnline::ESI::Models::AssetName)] }

      before { subject.instance_variable_set(:@assets_names, assets_names) }

      specify { expect(subject.assets_names).to eq(assets_names) }
    end

    context "when @assets_names not set" do
      let(:asset_name) { instance_double(EveOnline::ESI::Models::AssetName) }

      let(:response) do
        [
          {
            item_id: 1_001_215_602_246,
            name: "HOLE"
          }
        ]
      end

      before do
        #
        # subject.response # => [{"item_id"=>1001215602246, "name"=>"HOLE"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::AssetName.new(response.first) # => asset_name
        #
        expect(EveOnline::ESI::Models::AssetName).to receive(:new).with(response.first).and_return(asset_name)
      end

      specify { expect(subject.assets_names).to eq([asset_name]) }

      specify { expect { subject.assets_names }.to change { subject.instance_variable_get(:@assets_names) }.from(nil).to([asset_name]) }
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
      expect(subject.path).to eq("/v1/corporations/12345678/assets/names/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v1/corporations/12345678/assets/names/")
    end
  end
end
