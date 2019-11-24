# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Event do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:event) { described_class.new(options) }

    let(:event_date) { double }

    before { expect(event).to receive(:event_date).and_return(event_date) }

    before { expect(event).to receive(:event_id).and_return(1_635_247) }

    before { expect(event).to receive(:event_response).and_return("not_responded") }

    before { expect(event).to receive(:importance).and_return(0) }

    before { expect(event).to receive(:title).and_return("Moon extraction") }

    subject { event.as_json }

    its([:event_date]) { should eq(event_date) }

    its([:event_id]) { should eq(1_635_247) }

    its([:event_response]) { should eq("not_responded") }

    its([:importance]) { should eq(0) }

    its([:title]) { should eq("Moon extraction") }
  end

  describe "#event_date" do
    context "when event_date is present" do
      let(:event_date) { double }

      before { expect(options).to receive(:[]).with("event_date").and_return(event_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(event_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(event_date)
      end

      specify { expect { subject.event_date }.not_to raise_error }
    end

    context "when event_date not present" do
      before { expect(options).to receive(:[]).with("event_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.event_date }.not_to raise_error }
    end
  end

  describe "#event_id" do
    before { expect(options).to receive(:[]).with("event_id") }

    specify { expect { subject.event_id }.not_to raise_error }
  end

  describe "#event_response" do
    before { expect(options).to receive(:[]).with("event_response") }

    specify { expect { subject.event_response }.not_to raise_error }
  end

  describe "#importance" do
    before { expect(options).to receive(:[]).with("importance") }

    specify { expect { subject.importance }.not_to raise_error }
  end

  describe "#title" do
    before { expect(options).to receive(:[]).with("title") }

    specify { expect { subject.title }.not_to raise_error }
  end
end
