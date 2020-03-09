# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::WalletTransaction do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  # describe "#as_json" do
  #   let(:wallet_transaction) { described_class.new(options) }
  #
  #   before { expect(wallet_transaction).to receive(:client_id).and_return(-9.5) }
  #
  #   subject { wallet_transaction.as_json }
  #
  #   its([:client_id]) { should eq(-9.5) }
  #
  # end

    # client_id: client_id,
  #     date: date,
  #     is_buy: is_buy,
  #     is_personal: is_personal,
  #     journal_ref_id: journal_ref_id,
  #     location_id: location_id,
  #     quantity: quantity,
  #     transaction_id: transaction_id,
  #     type_id: type_id,
  #     unit_price: unit_price


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
