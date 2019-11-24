# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::AssetName do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:asset_name) { described_class.new(options) }

    before { expect(asset_name).to receive(:item_id).and_return(1_001_215_602_246) }

    before { expect(asset_name).to receive(:name).and_return("HOLE") }

    subject { asset_name.as_json }

    its([:item_id]) { should eq(1_001_215_602_246) }

    its([:name]) { should eq("HOLE") }
  end

  describe "#item_id" do
    before { expect(options).to receive(:[]).with("item_id") }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end
end
