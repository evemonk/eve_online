require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::Models::LoyaltyPoint do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:loyalty_point) { described_class.new(options) }

    before { expect(loyalty_point).to receive(:corporation_id).and_return(1_000_035) }

    before { expect(loyalty_point).to receive(:loyalty_points).and_return(14_163) }

    subject { loyalty_point.as_json }

    its([:corporation_id]) { should eq(1_000_035) }

    its([:loyalty_points]) { should eq(14_163) }
  end

  describe '#corporation_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['corporation_id']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('corporation_id')
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#loyalty_points' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options['loyalty_points']
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:[]).with('loyalty_points')
        end
      end
    end

    specify { expect { subject.loyalty_points }.not_to raise_error }
  end
end
