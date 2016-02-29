require 'spec_helper'

describe EveOnline::Item do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:item) { described_class.new }

    before { expect(item).to receive(:item_id).and_return(408887580) }

    before { expect(item).to receive(:location_id).and_return(60000634) }

    before { expect(item).to receive(:type_id).and_return(588) }

    before { expect(item).to receive(:quantity).and_return(1) }

    before { expect(item).to receive(:flag).and_return(4) }

    before { expect(item).to receive(:singleton).and_return(1) }

    before { expect(item).to receive(:raw_quantity).and_return(-1) }

    subject { item.as_json }

    its([:item_id]) { should eq(408887580) }

    its([:location_id]) { should eq(60000634) }

    its([:type_id]) { should eq(588) }

    its([:quantity]) { should eq(1) }

    its([:flag]) { should eq(4) }

    its([:singleton]) { should eq(1) }

    its([:raw_quantity]) { should eq(-1) }
  end

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
      # subject.options.fetch('@location_id').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@location_id') do
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

  describe '#flag' do
    before do
      #
      # subject.options.fetch('@flag').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@flag') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.flag }.not_to raise_error }
  end

  describe '#singleton' do
    before do
      #
      # subject.options.fetch('@singleton').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@singleton') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.singleton }.not_to raise_error }
  end

  describe '#raw_quantity' do
    before do
      #
      # subject.options.fetch('@rawQuantity').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@rawQuantity') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.raw_quantity }.not_to raise_error }
  end
end
