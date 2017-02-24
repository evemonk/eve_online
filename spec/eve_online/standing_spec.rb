require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Standing do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:standing) { described_class.new(options) }

    before { expect(standing).to receive(:from_id).and_return(3_008_771) }

    before { expect(standing).to receive(:from_name).and_return('Nehrnah Gorouyar') }

    before { expect(standing).to receive(:standing).and_return(0.12) }

    subject { standing.as_json }

    its([:from_id]) { should eq(3_008_771) }

    its([:from_name]) { should eq('Nehrnah Gorouyar') }

    its([:standing]) { should eq(0.12) }
  end

  describe '#from_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@fromID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@fromID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.from_id }.not_to raise_error }
  end

  describe '#from_name' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@fromName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@fromName')
        end
      end
    end

    specify { expect { subject.from_name }.not_to raise_error }
  end

  describe '#standing' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@standing').to_f
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@standing') do
            double.tap do |b|
              expect(b).to receive(:to_f)
            end
          end
        end
      end
    end

    specify { expect { subject.standing }.not_to raise_error }
  end
end
