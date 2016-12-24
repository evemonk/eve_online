require 'spec_helper'

describe EveOnline::SDE::Models::InvPosition do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:inv_position) { described_class.new(data) }

    let(:item_id) { double }

    let(:pitch) { double }

    let(:roll) { double }

    let(:x) { double }

    let(:y) { double }

    let(:yaw) { double }

    let(:z) { double }

    before { expect(inv_position).to receive(:item_id).and_return(item_id) }

    before { expect(inv_position).to receive(:pitch).and_return(pitch) }

    before { expect(inv_position).to receive(:roll).and_return(roll) }

    before { expect(inv_position).to receive(:x).and_return(x) }

    before { expect(inv_position).to receive(:y).and_return(y) }

    before { expect(inv_position).to receive(:yaw).and_return(yaw) }

    before { expect(inv_position).to receive(:z).and_return(z) }

    subject { inv_position.as_json }

    its([:item_id]) { should eq(item_id) }

    its([:pitch]) { should eq(pitch) }

    its([:roll]) { should eq(roll) }

    its([:x]) { should eq(x) }

    its([:y]) { should eq(y) }

    its([:yaw]) { should eq(yaw) }

    its([:z]) { should eq(z) }
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

  describe '#pitch' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['pitch']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('pitch')
        end
      end
    end

    specify { expect { subject.pitch }.not_to raise_error }
  end

  describe '#roll' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['roll']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('roll')
        end
      end
    end

    specify { expect { subject.roll }.not_to raise_error }
  end

  describe '#x' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['x']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('x')
        end
      end
    end

    specify { expect { subject.x }.not_to raise_error }
  end

  describe '#y' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['y']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('y')
        end
      end
    end

    specify { expect { subject.y }.not_to raise_error }
  end

  describe '#yaw' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['yaw']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('yaw')
        end
      end
    end

    specify { expect { subject.yaw }.not_to raise_error }
  end

  describe '#z' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['z']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('z')
        end
      end
    end

    specify { expect { subject.z }.not_to raise_error }
  end
end
