# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::SDE::InvNames do
  let(:file) { double }

  subject { described_class.new(file) }

  specify { expect(subject).to be_a(EveOnline::SDE::Base) }

  describe '#inv_names' do
    let(:item) { double }

    let(:inv_name) { double }

    before { expect(subject).to receive(:data).and_return([item]) }

    before do
      #
      # EveOnline::SDE::Models::InvName.new(item) => inv_name
      #
      expect(EveOnline::SDE::Models::InvName).to receive(:new).with(item).and_return(inv_name)
    end

    specify { expect(subject.inv_names).to eq([inv_name]) }

    specify { expect { subject.inv_names }.to change { subject.instance_variable_defined?(:@_memoized_inv_names) }.from(false).to(true) }
  end
end
