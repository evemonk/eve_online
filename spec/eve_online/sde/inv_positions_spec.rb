require 'spec_helper'

describe EveOnline::SDE::InvPositions do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#inv_positions' do
    let(:item) { double }

    let(:inv_position) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::InvPosition.new(item) => inv_position
      #
      expect(EveOnline::SDE::Models::InvPosition).to receive(:new).with(item).and_return(inv_position)
    end

    specify { expect(subject.inv_positions).to eq([inv_position]) }

    specify { expect { subject.inv_positions }.to change { subject.instance_variable_defined?(:@_memoized_inv_positions) }.from(false).to(true) }
  end
end
