# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::Models::InvFlag do
  describe '#initialize' do
    let(:data) { double }

    subject { described_class.new(data) }

    its(:data) { should eq(data) }
  end

  describe '#as_json' do
    let(:data) { double }

    let(:inv_flag) { described_class.new(data) }

    let(:flag_id) { double }

    let(:flag_name) { double }

    let(:flag_text) { double }

    let(:order_id) { double }

    before { expect(inv_flag).to receive(:flag_id).and_return(flag_id) }

    before { expect(inv_flag).to receive(:flag_name).and_return(flag_name) }

    before { expect(inv_flag).to receive(:flag_text).and_return(flag_text) }

    before { expect(inv_flag).to receive(:order_id).and_return(order_id) }

    subject { inv_flag.as_json }

    its([:flag_id]) { should eq(flag_id) }

    its([:flag_name]) { should eq(flag_name) }

    its([:flag_text]) { should eq(flag_text) }

    its([:order_id]) { should eq(order_id) }
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

  describe '#flag_name' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['flagName']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('flagName')
        end
      end
    end

    specify { expect { subject.flag_name }.not_to raise_error }
  end

  describe '#flag_text' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['flagText']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('flagText')
        end
      end
    end

    specify { expect { subject.flag_text }.not_to raise_error }
  end

  describe '#order_id' do
    let(:data) { double }

    subject { described_class.new(data) }

    before do
      #
      # subject.data['orderID']
      #
      expect(subject).to receive(:data) do
        double.tap do |a|
          expect(a).to receive(:[]).with('orderID')
        end
      end
    end

    specify { expect { subject.order_id }.not_to raise_error }
  end
end
