require 'spec_helper'

describe EveOnline::SDE::InvItems do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#inv_items' do
    let(:item) { double }

    let(:inv_item) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::InvItem.new(item) => inv_item
      #
      expect(EveOnline::SDE::Models::InvItem).to receive(:new).with(item).and_return(inv_item)
    end

    specify { expect(subject.inv_items).to eq([inv_item]) }

    specify { expect { subject.inv_items }.to change { subject.instance_variable_defined?(:@_memoized_inv_items) }.from(false).to(true) }
  end
end
