require 'spec_helper'

describe EveOnline::SDE::ChrRaces do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#chr_races' do
    let(:item) { double }

    let(:chr_race) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::ChrRace.new(item) => chr_race
      #
      expect(EveOnline::SDE::Models::ChrRace).to receive(:new).with(item).and_return(chr_race)
    end

    specify { expect(subject.chr_races).to eq([chr_race]) }

    specify { expect { subject.chr_races }.to change { subject.instance_variable_defined?(:@_memoized_chr_races) }.from(false).to(true) }
  end
end
