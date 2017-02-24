require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::JumpClone do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:jump_clone) { described_class.new(options) }

    before { expect(jump_clone).to receive(:jump_clone_id).and_return(22_357_400) }

    before { expect(jump_clone).to receive(:type_id).and_return(164) }

    before { expect(jump_clone).to receive(:location_id).and_return(61_000_032) }

    before { expect(jump_clone).to receive(:clone_name).and_return('') }

    subject { jump_clone.as_json }

    its([:jump_clone_id]) { should eq(22_357_400) }

    its([:type_id]) { should eq(164) }

    its([:location_id]) { should eq(61_000_032) }

    its([:clone_name]) { should eq('') }
  end

  describe '#jump_clone_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@jumpCloneID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@jumpCloneID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.jump_clone_id }.not_to raise_error }
  end

  describe '#type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@typeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@typeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#location_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@locationID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@locationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#clone_name' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@cloneName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@cloneName')
        end
      end
    end

    specify { expect { subject.clone_name }.not_to raise_error }
  end
end
