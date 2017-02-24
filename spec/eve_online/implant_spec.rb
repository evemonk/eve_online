require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Implant do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:implant) { described_class.new(options) }

    before { expect(implant).to receive(:type_id).and_return(9_899) }

    before { expect(implant).to receive(:type_name).and_return('Ocular Filter - Basic') }

    subject { implant.as_json }

    its([:type_id]) { should eq(9_899) }

    its([:type_name]) { should eq('Ocular Filter - Basic') }
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
