# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::WalletJournal do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:wallet_journal_entry) { described_class.new(options) }

    let(:context_id) { double }

    let(:context_id_type) { double }

    let(:date) { double }

    let(:description) { double }

    let(:wallet_journal_id) { double }

    let(:reason) { double }

    let(:second_party_id) { double }

    let(:tax) { double }

    let(:tax_receiver_id) { double }

    before { expect(wallet_journal_entry).to receive(:amount).and_return(-9.5) }

    before { expect(wallet_journal_entry).to receive(:balance).and_return(4990.5) }

    before { expect(wallet_journal_entry).to receive(:context_id).and_return(context_id) }

    before { expect(wallet_journal_entry).to receive(:context_id_type).and_return(context_id_type) }

    before { expect(wallet_journal_entry).to receive(:date).and_return(date) }

    before { expect(wallet_journal_entry).to receive(:description).and_return(description) }

    before { expect(wallet_journal_entry).to receive(:first_party_id).and_return(90_729_314) }

    before { expect(wallet_journal_entry).to receive(:wallet_journal_id).and_return(wallet_journal_id) }

    before { expect(wallet_journal_entry).to receive(:reason).and_return(reason) }

    before { expect(wallet_journal_entry).to receive(:ref_type).and_return("market_escrow") }

    before { expect(wallet_journal_entry).to receive(:second_party_id).and_return(second_party_id) }

    before { expect(wallet_journal_entry).to receive(:tax).and_return(tax) }

    before { expect(wallet_journal_entry).to receive(:tax_receiver_id).and_return(tax_receiver_id) }

    subject { wallet_journal_entry.as_json }

    its([:amount]) { should eq(-9.5) }

    its([:balance]) { should eq(4990.5) }

    its([:context_id]) { should eq(context_id) }

    its([:context_id_type]) { should eq(context_id_type) }

    its([:date]) { should eq(date) }

    its([:description]) { should eq(description) }

    its([:first_party_id]) { should eq(90_729_314) }

    its([:wallet_journal_id]) { should eq(wallet_journal_id) }

    its([:reason]) { should eq(reason) }

    its([:ref_type]) { should eq("market_escrow") }

    its([:second_party_id]) { should eq(second_party_id) }

    its([:tax]) { should eq(tax) }

    its([:tax_receiver_id]) { should eq(tax_receiver_id) }
  end

  describe "#amount" do
    before { expect(options).to receive(:[]).with("amount") }

    specify { expect { subject.amount }.not_to raise_error }
  end

  describe "#balance" do
    before { expect(options).to receive(:[]).with("balance") }

    specify { expect { subject.balance }.not_to raise_error }
  end

  describe "#context_id" do
    before { expect(options).to receive(:[]).with("context_id") }

    specify { expect { subject.context_id }.not_to raise_error }
  end

  describe "#context_id_type" do
    before { expect(options).to receive(:[]).with("context_id_type") }

    specify { expect { subject.context_id_type }.not_to raise_error }
  end

  describe "#date" do
    context "when date is present" do
      let(:date) { double }

      before { expect(options).to receive(:[]).with("date").and_return(date) }

      before do
        #
        # subject.parse_datetime_with_timezone(date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date)
      end

      specify { expect { subject.date }.not_to raise_error }
    end

    context "when date not present" do
      before { expect(options).to receive(:[]).with("date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date }.not_to raise_error }
    end
  end

  describe "#description" do
    before { expect(options).to receive(:[]).with("description") }

    specify { expect { subject.description }.not_to raise_error }
  end

  describe "#first_party_id" do
    before { expect(options).to receive(:[]).with("first_party_id") }

    specify { expect { subject.first_party_id }.not_to raise_error }
  end

  describe "#wallet_journal_id" do
    before { expect(options).to receive(:[]).with("id") }

    specify { expect { subject.wallet_journal_id }.not_to raise_error }
  end

  describe "#reason" do
    before { expect(options).to receive(:[]).with("reason") }

    specify { expect { subject.reason }.not_to raise_error }
  end

  describe "#ref_type" do
    before { expect(options).to receive(:[]).with("ref_type") }

    specify { expect { subject.ref_type }.not_to raise_error }
  end

  describe "#second_party_id" do
    before { expect(options).to receive(:[]).with("second_party_id") }

    specify { expect { subject.second_party_id }.not_to raise_error }
  end

  describe "#tax" do
    before { expect(options).to receive(:[]).with("tax") }

    specify { expect { subject.tax }.not_to raise_error }
  end

  describe "#tax_receiver_id" do
    before { expect(options).to receive(:[]).with("tax_receiver_id") }

    specify { expect { subject.tax_receiver_id }.not_to raise_error }
  end
end
