require 'spec_helper'

describe EveOnline::SDE::InvFlags do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#inv_flags' do
    let(:item) { double }

    let(:inv_flag) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::InvFlag.new(item) => inv_flag
      #
      expect(EveOnline::SDE::Models::InvFlag).to receive(:new).with(item).and_return(inv_flag)
    end

    specify { expect(subject.inv_flags).to eq([inv_flag]) }

    specify { expect { subject.inv_flags }.to change { subject.instance_variable_defined?(:@_memoized_inv_flags) }.from(false).to(true) }
  end
end
