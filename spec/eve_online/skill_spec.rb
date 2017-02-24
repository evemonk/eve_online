require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Skill do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:skill) { described_class.new(options) }

    before { expect(skill).to receive(:type_id).and_return(2_495) }

    before { expect(skill).to receive(:skillpoints).and_return(1_000) }

    before { expect(skill).to receive(:level).and_return(1) }

    before { expect(skill).to receive(:published).and_return(true) }

    subject { skill.as_json }

    its([:type_id]) { should eq(2_495) }

    its([:skillpoints]) { should eq(1_000) }

    its([:level]) { should eq(1) }

    its([:published]) { should eq(true) }
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

  describe '#skillpoints' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@skillpoints').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@skillpoints') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.skillpoints }.not_to raise_error }
  end

  describe '#level' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@level').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@level') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.level }.not_to raise_error }
  end

  describe '#published' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@published') == '1'
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@published') do
            double.tap do |b|
              expect(b).to receive(:==).with('1')
            end
          end
        end
      end
    end

    specify { expect { subject.published }.not_to raise_error }
  end
end
