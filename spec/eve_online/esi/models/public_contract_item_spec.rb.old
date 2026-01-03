# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::PublicContractItem do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:contract_item) { described_class.new(options) }

    let(:is_blueprint_copy) { double }

    let(:is_included) { double }

    before { expect(contract_item).to receive(:is_blueprint_copy).and_return(is_blueprint_copy) }

    before { expect(contract_item).to receive(:is_included).and_return(is_included) }

    before { expect(contract_item).to receive(:item_id).and_return(1_029_552_558_074) }

    before { expect(contract_item).to receive(:material_efficiency).and_return(10) }

    before { expect(contract_item).to receive(:quantity).and_return(1) }

    before { expect(contract_item).to receive(:record_id).and_return(3_210_378_611) }

    before { expect(contract_item).to receive(:runs).and_return(400) }

    before { expect(contract_item).to receive(:time_efficiency).and_return(20) }

    before { expect(contract_item).to receive(:type_id).and_return(29_040) }

    subject { contract_item.as_json }

    its([:is_blueprint_copy]) { should eq(is_blueprint_copy) }

    its([:is_included]) { should eq(is_included) }

    its([:item_id]) { should eq(1_029_552_558_074) }

    its([:material_efficiency]) { should eq(10) }

    its([:quantity]) { should eq(1) }

    its([:record_id]) { should eq(3_210_378_611) }

    its([:runs]) { should eq(400) }

    its([:time_efficiency]) { should eq(20) }

    its([:type_id]) { should eq(29_040) }
  end

  describe "#is_blueprint_copy" do
    before { expect(options).to receive(:[]).with("is_blueprint_copy") }

    specify { expect { subject.is_blueprint_copy }.not_to raise_error }
  end

  describe "#is_included" do
    before { expect(options).to receive(:[]).with("is_included") }

    specify { expect { subject.is_included }.not_to raise_error }
  end

  describe "#item_id" do
    before { expect(options).to receive(:[]).with("item_id") }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe "#material_efficiency" do
    before { expect(options).to receive(:[]).with("material_efficiency") }

    specify { expect { subject.material_efficiency }.not_to raise_error }
  end

  describe "#quantity" do
    before { expect(options).to receive(:[]).with("quantity") }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe "#record_id" do
    before { expect(options).to receive(:[]).with("record_id") }

    specify { expect { subject.record_id }.not_to raise_error }
  end

  describe "#runs" do
    before { expect(options).to receive(:[]).with("runs") }

    specify { expect { subject.runs }.not_to raise_error }
  end

  describe "#time_efficiency" do
    before { expect(options).to receive(:[]).with("time_efficiency") }

    specify { expect { subject.time_efficiency }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
