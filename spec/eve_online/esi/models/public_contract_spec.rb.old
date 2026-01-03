# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::PublicContract do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:contract) { described_class.new(options) }

    let(:buyout) { double }

    let(:date_expired) { double }

    let(:date_issued) { double }

    let(:for_corporation) { double }

    let(:title) { double }

    before { expect(contract).to receive(:buyout).and_return(buyout) }

    before { expect(contract).to receive(:collateral).and_return(0.0) }

    before { expect(contract).to receive(:contract_id).and_return(154837125) }

    before { expect(contract).to receive(:date_expired).and_return(date_expired) }

    before { expect(contract).to receive(:date_issued).and_return(date_issued) }

    before { expect(contract).to receive(:days_to_complete).and_return(0) }

    before { expect(contract).to receive(:end_location_id).and_return(60008674) }

    before { expect(contract).to receive(:for_corporation).and_return(for_corporation) }

    before { expect(contract).to receive(:issuer_corporation_id).and_return(98134807) }

    before { expect(contract).to receive(:issuer_id).and_return(1337512245) }

    before { expect(contract).to receive(:price).and_return(0.0) }

    before { expect(contract).to receive(:reward).and_return(0.0) }

    before { expect(contract).to receive(:start_location_id).and_return(60008674) }

    before { expect(contract).to receive(:title).and_return(title) }

    before { expect(contract).to receive(:kind).and_return("item_exchange") }

    before { expect(contract).to receive(:volume).and_return(15000.0) }

    subject { contract.as_json }

    its([:buyout]) { should eq(buyout) }

    its([:collateral]) { should eq(0.0) }

    its([:contract_id]) { should eq(154837125) }

    its([:date_expired]) { should eq(date_expired) }

    its([:date_issued]) { should eq(date_issued) }

    its([:days_to_complete]) { should eq(0) }

    its([:end_location_id]) { should eq(60008674) }

    its([:for_corporation]) { should eq(for_corporation) }

    its([:issuer_corporation_id]) { should eq(98134807) }

    its([:issuer_id]) { should eq(1337512245) }

    its([:price]) { should eq(0.0) }

    its([:reward]) { should eq(0.0) }

    its([:start_location_id]) { should eq(60008674) }

    its([:title]) { should eq(title) }

    its([:kind]) { should eq("item_exchange") }

    its([:volume]) { should eq(15000.0) }
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

  describe "#title" do
    before { expect(options).to receive(:[]).with("title") }

    specify { expect { subject.title }.not_to raise_error }
  end

  describe "#kind" do
    before { expect(options).to receive(:[]).with("type") }

    specify { expect { subject.kind }.not_to raise_error }
  end

  describe "#volume" do
    before { expect(options).to receive(:[]).with("volume") }

    specify { expect { subject.volume }.not_to raise_error }
  end
end
