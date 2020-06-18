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

    # TODO: write
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
