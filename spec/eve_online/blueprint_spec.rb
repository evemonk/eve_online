require 'spec_helper'

describe EveOnline::Blueprint do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    specify { expect(subject.options).to eq(options) }
  end

  describe '#as_json'

  describe '#item_id' do
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
