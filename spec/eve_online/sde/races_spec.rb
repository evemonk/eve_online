require 'spec_helper'

describe EveOnline::SDE::Races do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#races' do
    let(:item) { double }

    let(:race) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::Race.new(item) => race
      #
      expect(EveOnline::SDE::Models::Race).to receive(:new).with(item).and_return(race)
    end

    specify { expect(subject.races).to eq([race]) }

    specify { expect { subject.races }.to change { subject.instance_variable_defined?(:@_memoized_races) }.from(false).to(true) }
  end
end
