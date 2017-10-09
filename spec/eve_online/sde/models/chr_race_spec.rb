require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::SDE::Models::ChrRace do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:chr_race) { described_class.new(data) }

    let(:race_id) { double }

    let(:race_name) { double }

    let(:short_description) { double }

    let(:description) { double }

    let(:icon_id) { double }

    before { expect(chr_race).to receive(:race_id).and_return(race_id) }

    before { expect(chr_race).to receive(:race_name).and_return(race_name) }

    before { expect(chr_race).to receive(:short_description).and_return(short_description) }

    before { expect(chr_race).to receive(:description).and_return(description) }

    before { expect(chr_race).to receive(:icon_id).and_return(icon_id) }

    subject { chr_race.as_json }

    its([:race_id]) { should eq(race_id) }

    its([:race_name]) { should eq(race_name) }

    its([:short_description]) { should eq(short_description) }

    its([:description]) { should eq(description) }

    its([:icon_id]) { should eq(icon_id) }
  end

  describe '#race_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['raceID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('raceID')
        end
      end
    end

    specify { expect { subject.race_id }.not_to raise_error }
  end

  describe '#race_name' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['raceName']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('raceName')
        end
      end
    end

    specify { expect { subject.race_name }.not_to raise_error }
  end

  describe '#short_description' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['shortDescription']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('shortDescription')
        end
      end
    end

    specify { expect { subject.short_description }.not_to raise_error }
  end

  describe '#description' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['description']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('description')
        end
      end
    end

    specify { expect { subject.description }.not_to raise_error }
  end

  describe '#icon_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['iconID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('iconID')
        end
      end
    end

    specify { expect { subject.icon_id }.not_to raise_error }
  end
end
