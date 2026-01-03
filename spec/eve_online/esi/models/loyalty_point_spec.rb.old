# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::LoyaltyPoint do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:loyalty_point) { described_class.new(options) }

    before { expect(loyalty_point).to receive(:corporation_id).and_return(1_000_035) }

    before { expect(loyalty_point).to receive(:loyalty_points).and_return(14_163) }

    subject { loyalty_point.as_json }

    its([:corporation_id]) { should eq(1_000_035) }

    its([:loyalty_points]) { should eq(14_163) }
  end

  describe "#corporation_id" do
    before { expect(options).to receive(:[]).with("corporation_id") }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe "#loyalty_points" do
    before { expect(options).to receive(:[]).with("loyalty_points") }

    specify { expect { subject.loyalty_points }.not_to raise_error }
  end
end
