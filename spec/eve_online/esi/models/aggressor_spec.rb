# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Aggressor do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:aggressor) { described_class.new(options) }

    before { expect(aggressor).to receive(:alliance_id).and_return(99_009_475) }

    before { expect(aggressor).to receive(:corporation_id).and_return(98_551_342) }

    before { expect(aggressor).to receive(:isk_destroyed).and_return(222167.22000000003) }

    before { expect(aggressor).to receive(:ships_killed).and_return(99) }

    subject { aggressor.as_json }

    its([:alliance_id]) { should eq(99_009_475) }

    its([:corporation_id]) { should eq(98_551_342) }

    its([:isk_destroyed]) { should eq(222167.22000000003) }

    its([:ships_killed]) { should eq(99) }
  end

  describe "#alliance_id" do
    before { expect(options).to receive(:[]).with("alliance_id") }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe "#corporation_id" do
    before { expect(options).to receive(:[]).with("corporation_id") }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe "#isk_destroyed" do
    before { expect(options).to receive(:[]).with("isk_destroyed") }

    specify { expect { subject.isk_destroyed }.not_to raise_error }
  end

  describe "#ships_killed" do
    before { expect(options).to receive(:[]).with("ships_killed") }

    specify { expect { subject.ships_killed }.not_to raise_error }
  end
end
