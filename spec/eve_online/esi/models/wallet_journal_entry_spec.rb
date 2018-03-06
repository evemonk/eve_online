# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::WalletJournalEntry do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:wallet_journal_entry) { described_class.new(options) }

    let(:date) { double }

    let(:second_party_id) { double }

    let(:second_party_type) { double }

    let(:reason) { double }

    let(:tax_receiver_id) { double }

    let(:tax) { double }

    before { expect(wallet_journal_entry).to receive(:date).and_return(date) }

    before { expect(wallet_journal_entry).to receive(:ref_id).and_return(15_264_764_711) }

    before { expect(wallet_journal_entry).to receive(:ref_type).and_return('market_escrow') }

    before { expect(wallet_journal_entry).to receive(:first_party_id).and_return(90_729_314) }

    before { expect(wallet_journal_entry).to receive(:first_party_type).and_return('character') }

    before { expect(wallet_journal_entry).to receive(:amount).and_return(-9.5) }

    before { expect(wallet_journal_entry).to receive(:balance).and_return(4990.5) }

    before { expect(wallet_journal_entry).to receive(:second_party_id).and_return(second_party_id) }

    before { expect(wallet_journal_entry).to receive(:second_party_type).and_return(second_party_type) }

    before { expect(wallet_journal_entry).to receive(:reason).and_return(reason) }

    before { expect(wallet_journal_entry).to receive(:tax_receiver_id).and_return(tax_receiver_id) }

    before { expect(wallet_journal_entry).to receive(:tax).and_return(tax) }

    subject { wallet_journal_entry.as_json }

    its([:date]) { should eq(date) }

    its([:ref_id]) { should eq(15_264_764_711) }

    its([:ref_type]) { should eq('market_escrow') }

    its([:first_party_id]) { should eq(90_729_314) }

    its([:first_party_type]) { should eq('character') }

    its([:amount]) { should eq(-9.5) }

    its([:balance]) { should eq(4990.5) }

    its([:second_party_id]) { should eq(second_party_id) }

    its([:second_party_type]) { should eq(second_party_type) }

    its([:reason]) { should eq(reason) }

    its([:tax_receiver_id]) { should eq(tax_receiver_id) }

    its([:tax]) { should eq(tax) }
  end

  describe '#date' do
    context 'when date is present' do
      let(:date) { double }

      before { expect(options).to receive(:[]).with('date').and_return(date) }

      before do
        #
        # subject.parse_datetime_with_timezone(date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date)
      end

      specify { expect { subject.date }.not_to raise_error }
    end

    context 'when date not present' do
      before { expect(options).to receive(:[]).with('date').and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date }.not_to raise_error }
    end
  end

  describe '#ref_id' do
    before { expect(options).to receive(:[]).with('ref_id') }

    specify { expect { subject.ref_id }.not_to raise_error }
  end

  describe '#ref_type' do
    before { expect(options).to receive(:[]).with('ref_type') }

    specify { expect { subject.ref_type }.not_to raise_error }
  end

  describe '#first_party_id' do
    before { expect(options).to receive(:[]).with('first_party_id') }

    specify { expect { subject.first_party_id }.not_to raise_error }
  end

  describe '#first_party_type' do
    before { expect(options).to receive(:[]).with('first_party_type') }

    specify { expect { subject.first_party_type }.not_to raise_error }
  end

  describe '#second_party_id' do
    before { expect(options).to receive(:[]).with('second_party_id') }

    specify { expect { subject.second_party_id }.not_to raise_error }
  end

  describe '#second_party_type' do
    before { expect(options).to receive(:[]).with('second_party_type') }

    specify { expect { subject.second_party_type }.not_to raise_error }
  end

  describe '#amount' do
    before { expect(options).to receive(:[]).with('amount') }

    specify { expect { subject.amount }.not_to raise_error }
  end

  describe '#balance' do
    before { expect(options).to receive(:[]).with('balance') }

    specify { expect { subject.balance }.not_to raise_error }
  end

  describe '#reason' do
    before { expect(options).to receive(:[]).with('reason') }

    specify { expect { subject.reason }.not_to raise_error }
  end

  describe '#tax_receiver_id' do
    before { expect(options).to receive(:[]).with('tax_receiver_id') }

    specify { expect { subject.tax_receiver_id }.not_to raise_error }
  end

  describe '#tax' do
    before { expect(options).to receive(:[]).with('tax') }

    specify { expect { subject.tax }.not_to raise_error }
  end
end
