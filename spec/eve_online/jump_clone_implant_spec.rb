require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::JumpCloneImplant do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:jump_clone_implant) { described_class.new(options) }

    before { expect(jump_clone_implant).to receive(:jump_clone_id).and_return(22_703_029) }

    before { expect(jump_clone_implant).to receive(:type_id).and_return(10_209) }

    before { expect(jump_clone_implant).to receive(:type_name).and_return('Memory Augmentation - Improved') }

    subject { jump_clone_implant.as_json }

    its([:jump_clone_id]) { should eq(22_703_029) }

    its([:type_id]) { should eq(10_209) }

    its([:type_name]) { should eq('Memory Augmentation - Improved') }
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

  describe '#type_name' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@typeName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@typeName')
        end
      end
    end

    specify { expect { subject.type_name }.not_to raise_error }
  end
end
