# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MarketPrice do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:market_price) { described_class.new(options) }

    before { expect(market_price).to receive(:adjusted_price).and_return(923_296.88) }

    before { expect(market_price).to receive(:average_price).and_return(1_273_871.6) }

    before { expect(market_price).to receive(:type_id).and_return(32_772) }

    subject { market_price.as_json }

    its([:adjusted_price]) { should eq(923_296.88) }

    its([:average_price]) { should eq(1_273_871.6) }

    its([:type_id]) { should eq(32_772) }
  end

  describe "#adjusted_price" do
    before { expect(options).to receive(:[]).with("adjusted_price") }

    specify { expect { subject.adjusted_price }.not_to raise_error }
  end

  describe "#average_price" do
    before { expect(options).to receive(:[]).with("average_price") }

    specify { expect { subject.average_price }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
