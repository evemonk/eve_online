# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::WalletTransaction do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:wallet_transaction) { described_class.new(options) }

    let(:date) { double }

    let(:is_buy) { double }

    let(:is_personal) { double }

    before { expect(wallet_transaction).to receive(:client_id).and_return(2116253203) }

    before { expect(wallet_transaction).to receive(:date).and_return(date) }

    before { expect(wallet_transaction).to receive(:is_buy).and_return(is_buy) }

    before { expect(wallet_transaction).to receive(:is_personal).and_return(is_personal) }

    before { expect(wallet_transaction).to receive(:journal_ref_id).and_return(17740411474) }

    before { expect(wallet_transaction).to receive(:location_id).and_return(60008494) }

    before { expect(wallet_transaction).to receive(:quantity).and_return(1) }

    before { expect(wallet_transaction).to receive(:transaction_id).and_return(5296927639) }

    before { expect(wallet_transaction).to receive(:type_id).and_return(3538) }

    before { expect(wallet_transaction).to receive(:unit_price).and_return(99887.79) }

    subject { wallet_transaction.as_json }

    its([:client_id]) { should eq(2116253203) }

    its([:date]) { should eq(date) }

    its([:is_buy]) { should eq(is_buy) }

    its([:is_personal]) { should eq(is_personal) }

    its([:journal_ref_id]) { should eq(17740411474) }

    its([:location_id]) { should eq(60008494) }

    its([:quantity]) { should eq(1) }

    its([:transaction_id]) { should eq(5296927639) }

    its([:type_id]) { should eq(3538) }

    its([:unit_price]) { should eq(99887.79) }
  end

  describe "#client_id" do
    before { expect(options).to receive(:[]).with("client_id") }

    specify { expect { subject.client_id }.not_to raise_error }
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

  describe "#is_buy" do
    before { expect(options).to receive(:[]).with("is_buy") }

    specify { expect { subject.is_buy }.not_to raise_error }
  end

  describe "#is_personal" do
    before { expect(options).to receive(:[]).with("is_personal") }

    specify { expect { subject.is_personal }.not_to raise_error }
  end

  describe "#journal_ref_id" do
    before { expect(options).to receive(:[]).with("journal_ref_id") }

    specify { expect { subject.journal_ref_id }.not_to raise_error }
  end

  describe "#location_id" do
    before { expect(options).to receive(:[]).with("location_id") }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe "#quantity" do
    before { expect(options).to receive(:[]).with("quantity") }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe "#transaction_id" do
    before { expect(options).to receive(:[]).with("transaction_id") }

    specify { expect { subject.transaction_id }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#unit_price" do
    before { expect(options).to receive(:[]).with("unit_price") }

    specify { expect { subject.unit_price }.not_to raise_error }
  end
end
