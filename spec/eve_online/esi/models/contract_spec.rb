# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Contract do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  # describe "#as_json" do
  #   let(:contract) { described_class.new(options) }
  #
  #   before { expect(contract).to receive(:constellation_id).and_return(20_000_001) }
  #
  # end

  describe "#acceptor_id" do
    before { expect(options).to receive(:[]).with("acceptor_id") }

    specify { expect { subject.acceptor_id }.not_to raise_error }
  end

  describe "#assignee_id" do
    before { expect(options).to receive(:[]).with("assignee_id") }

    specify { expect { subject.assignee_id }.not_to raise_error }
  end

  describe "#availability" do
    before { expect(options).to receive(:[]).with("availability") }

    specify { expect { subject.availability }.not_to raise_error }
  end

  describe "#buyout" do
    before { expect(options).to receive(:[]).with("buyout") }

    specify { expect { subject.buyout }.not_to raise_error }
  end

  describe "#collateral" do
    before { expect(options).to receive(:[]).with("collateral") }

    specify { expect { subject.collateral }.not_to raise_error }
  end

  describe "#contract_id" do
    before { expect(options).to receive(:[]).with("contract_id") }

    specify { expect { subject.contract_id }.not_to raise_error }
  end

  describe "#date_accepted" do
    context "when date_accepted is present" do
      let(:date_accepted) { double }

      before { expect(options).to receive(:[]).with("date_accepted").and_return(date_accepted) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_accepted)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_accepted)
      end

      specify { expect { subject.date_accepted }.not_to raise_error }
    end

    context "when date_accepted not present" do
      before { expect(options).to receive(:[]).with("date_accepted").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_accepted }.not_to raise_error }
    end
  end

  describe "#date_completed" do
    context "when date_completed is present" do
      let(:date_completed) { double }

      before { expect(options).to receive(:[]).with("date_completed").and_return(date_completed) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_completed)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_completed)
      end

      specify { expect { subject.date_completed }.not_to raise_error }
    end

    context "when date_completed not present" do
      before { expect(options).to receive(:[]).with("date_completed").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_completed }.not_to raise_error }
    end
  end

  describe "#date_expired" do
    context "when date_expired is present" do
      let(:date_expired) { double }

      before { expect(options).to receive(:[]).with("date_expired").and_return(date_expired) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_expired)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_expired)
      end

      specify { expect { subject.date_expired }.not_to raise_error }
    end

    context "when date_expired not present" do
      before { expect(options).to receive(:[]).with("date_expired").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_expired }.not_to raise_error }
    end
  end

  describe "#date_issued" do
    context "when date_issued is present" do
      let(:date_issued) { double }

      before { expect(options).to receive(:[]).with("date_issued").and_return(date_issued) }

      before do
        #
        # subject.parse_datetime_with_timezone(date_issued)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(date_issued)
      end

      specify { expect { subject.date_issued }.not_to raise_error }
    end

    context "when date_issued not present" do
      before { expect(options).to receive(:[]).with("date_issued").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.date_issued }.not_to raise_error }
    end
  end

  describe "#days_to_complete" do
    before { expect(options).to receive(:[]).with("days_to_complete") }

    specify { expect { subject.days_to_complete }.not_to raise_error }
  end

  describe "#end_location_id" do
    before { expect(options).to receive(:[]).with("end_location_id") }

    specify { expect { subject.end_location_id }.not_to raise_error }
  end

  describe "#for_corporation" do
    before { expect(options).to receive(:[]).with("for_corporation") }

    specify { expect { subject.for_corporation }.not_to raise_error }
  end

  describe "#issuer_corporation_id" do
    before { expect(options).to receive(:[]).with("issuer_corporation_id") }

    specify { expect { subject.issuer_corporation_id }.not_to raise_error }
  end

  describe "#issuer_id" do
    before { expect(options).to receive(:[]).with("issuer_id") }

    specify { expect { subject.issuer_id }.not_to raise_error }
  end

  describe "#price" do
    before { expect(options).to receive(:[]).with("price") }

    specify { expect { subject.price }.not_to raise_error }
  end

  describe "#reward" do
    before { expect(options).to receive(:[]).with("reward") }

    specify { expect { subject.reward }.not_to raise_error }
  end

  describe "#start_location_id" do
    before { expect(options).to receive(:[]).with("start_location_id") }

    specify { expect { subject.start_location_id }.not_to raise_error }
  end

  describe "#status" do
    before { expect(options).to receive(:[]).with("status") }

    specify { expect { subject.status }.not_to raise_error }
  end

  describe "#title" do
    before { expect(options).to receive(:[]).with("title") }

    specify { expect { subject.title }.not_to raise_error }
  end

  describe "#type" do
    before { expect(options).to receive(:[]).with("type") }

    specify { expect { subject.type }.not_to raise_error }
  end

  describe "#volume" do
    before { expect(options).to receive(:[]).with("volume") }

    specify { expect { subject.volume }.not_to raise_error }
  end
end
