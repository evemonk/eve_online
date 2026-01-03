# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::OfferRequiredItem do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:offer_required_item) { described_class.new(options) }

    before { expect(offer_required_item).to receive(:quantity).and_return(5_000) }

    before { expect(offer_required_item).to receive(:type_id).and_return(234) }

    subject { offer_required_item.as_json }

    its([:quantity]) { should eq(5_000) }

    its([:type_id]) { should eq(234) }
  end

  describe "#quantity" do
    before { expect(options).to receive(:[]).with("quantity") }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
