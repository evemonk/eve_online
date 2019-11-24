# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Ally do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:ally) { described_class.new(options) }

    before { expect(ally).to receive(:alliance_id).and_return(99_009_475) }

    before { expect(ally).to receive(:corporation_id).and_return(98_551_342) }

    subject { ally.as_json }

    its([:alliance_id]) { should eq(99_009_475) }

    its([:corporation_id]) { should eq(98_551_342) }
  end

  describe "#alliance_id" do
    before { expect(options).to receive(:[]).with("alliance_id") }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe "#corporation_id" do
    before { expect(options).to receive(:[]).with("corporation_id") }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end
end
