# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MarketHistory do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:market_history) { described_class.new(options) }

    let(:date) { double }

    before { expect(market_history).to receive(:average).and_return(754_702_326.19) }

    before { expect(market_history).to receive(:date).and_return(date) }

    before { expect(market_history).to receive(:highest).and_return(769_999_999.99) }

    before { expect(market_history).to receive(:lowest).and_return(701_100_002.49) }

    before { expect(market_history).to receive(:order_count).and_return(52) }

    before { expect(market_history).to receive(:volume).and_return(52) }

    subject { market_history.as_json }

    its([:average]) { should eq(754_702_326.19) }

    its([:date]) { should eq(date) }

    its([:highest]) { should eq(769_999_999.99) }

    its([:lowest]) { should eq(701_100_002.49) }

    its([:order_count]) { should eq(52) }

    its([:volume]) { should eq(52) }
  end

  describe "#average" do
    before { expect(options).to receive(:[]).with("average") }

    specify { expect { subject.average }.not_to raise_error }
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

  describe "#highest" do
    before { expect(options).to receive(:[]).with("highest") }

    specify { expect { subject.highest }.not_to raise_error }
  end

  describe "#lowest" do
    before { expect(options).to receive(:[]).with("lowest") }

    specify { expect { subject.lowest }.not_to raise_error }
  end

  describe "#order_count" do
    before { expect(options).to receive(:[]).with("order_count") }

    specify { expect { subject.order_count }.not_to raise_error }
  end

  describe "#volume" do
    before { expect(options).to receive(:[]).with("volume") }

    specify { expect { subject.volume }.not_to raise_error }
  end
end
