require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Blueprint do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:blueprint) { described_class.new(options) }

    before { expect(blueprint).to receive(:item_id).and_return(716_338_097) }

    before { expect(blueprint).to receive(:location_id).and_return(61_000_032) }

    before { expect(blueprint).to receive(:type_id).and_return(1010) }

    before { expect(blueprint).to receive(:type_name).and_return('Small Shield Extender I Blueprint') }

    before { expect(blueprint).to receive(:flag_id).and_return(4) }

    before { expect(blueprint).to receive(:quantity).and_return(-2) }

    before { expect(blueprint).to receive(:time_efficiency).and_return(0) }

    before { expect(blueprint).to receive(:material_efficiency).and_return(10) }

    before { expect(blueprint).to receive(:runs).and_return(300) }

    subject { blueprint.as_json }

    its([:item_id]) { should eq(716_338_097) }

    its([:location_id]) { should eq(61_000_032) }

    its([:type_id]) { should eq(1_010) }

    its([:type_name]) { should eq('Small Shield Extender I Blueprint') }

    its([:flag_id]) { should eq(4) }

    its([:quantity]) { should eq(-2) }

    its([:time_efficiency]) { should eq(0) }

    its([:material_efficiency]) { should eq(10) }

    its([:runs]) { should eq(300) }
  end

  describe '#item_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@itemID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@itemID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.item_id }.not_to raise_error }
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
      # subject.options.fetch('@typeID')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@typeName')
        end
      end
    end

    specify { expect { subject.type_name }.not_to raise_error }
  end

  describe '#flag_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@flagID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@flagID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.flag_id }.not_to raise_error }
  end

  describe '#quantity' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@quantity').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@quantity') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe '#time_efficiency' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@timeEfficiency').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@timeEfficiency') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.time_efficiency }.not_to raise_error }
  end

  describe '#material_efficiencyv' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@materialEfficiency').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@materialEfficiency') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.material_efficiency }.not_to raise_error }
  end

  describe '#runs' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@runs').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@runs') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.runs }.not_to raise_error }
  end
end
