require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::SDE::Models::InvItem do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:inv_item) { described_class.new(data) }

    let(:flag_id) { double }

    let(:item_id) { double }

    let(:location_id) { double }

    let(:owner_id) { double }

    let(:quantity) { double }

    let(:type_id) { double }

    before { expect(inv_item).to receive(:flag_id).and_return(flag_id) }

    before { expect(inv_item).to receive(:item_id).and_return(item_id) }

    before { expect(inv_item).to receive(:location_id).and_return(location_id) }

    before { expect(inv_item).to receive(:owner_id).and_return(owner_id) }

    before { expect(inv_item).to receive(:quantity).and_return(quantity) }

    before { expect(inv_item).to receive(:type_id).and_return(type_id) }

    subject { inv_item.as_json }

    its([:flag_id]) { should eq(flag_id) }

    its([:item_id]) { should eq(item_id) }

    its([:location_id]) { should eq(location_id) }

    its([:owner_id]) { should eq(owner_id) }

    its([:quantity]) { should eq(quantity) }

    its([:type_id]) { should eq(type_id) }
  end

  describe '#flag_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['flagID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('flagID')
        end
      end
    end

    specify { expect { subject.flag_id }.not_to raise_error }
  end

  describe '#item_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['itemID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('itemID')
        end
      end
    end

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe '#location_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['locationID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('locationID')
        end
      end
    end

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#owner_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['ownerID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('ownerID')
        end
      end
    end

    specify { expect { subject.owner_id }.not_to raise_error }
  end

  describe '#quantity' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['quantity']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('quantity')
        end
      end
    end

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe '#type_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['typeID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('typeID')
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end
end
