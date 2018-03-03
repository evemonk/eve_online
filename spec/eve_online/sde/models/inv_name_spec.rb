# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::Models::InvName do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:inv_name) { described_class.new(data) }

    let(:item_id) { double }

    let(:item_name) { double }

    before { expect(inv_name).to receive(:item_id).and_return(item_id) }

    before { expect(inv_name).to receive(:item_name).and_return(item_name) }

    subject { inv_name.as_json }

    its([:item_id]) { should eq(item_id) }

    its([:item_name]) { should eq(item_name) }
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

  describe '#item_name' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['itemName']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('itemName')
        end
      end
    end

    specify { expect { subject.item_name }.not_to raise_error }
  end
end
