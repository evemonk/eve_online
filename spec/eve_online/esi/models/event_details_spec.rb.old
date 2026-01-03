# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::EventDetails do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:event) { described_class.new(options) }

    let(:date) { double }

    before { expect(event).to receive(:date).and_return(date) }

    before { expect(event).to receive(:duration).and_return(60) }

    before { expect(event).to receive(:event_id).and_return(1_635_247) }

    before { expect(event).to receive(:importance).and_return(0) }

    before { expect(event).to receive(:owner_id).and_return(1) }

    before { expect(event).to receive(:owner_name).and_return("Devas Weddo") }

    before { expect(event).to receive(:owner_type).and_return("character") }

    before { expect(event).to receive(:event_response).and_return("not_responded") }

    before { expect(event).to receive(:text).and_return("Extracting moon minerals") }

    before { expect(event).to receive(:title).and_return("Moon extraction") }

    subject { event.as_json }

    its([:date]) { should eq(date) }

    its([:duration]) { should eq(60) }

    its([:event_id]) { should eq(1_635_247) }

    its([:importance]) { should eq(0) }

    its([:owner_id]) { should eq(1) }

    its([:owner_name]) { should eq("Devas Weddo") }

    its([:owner_type]) { should eq("character") }

    its([:event_response]) { should eq("not_responded") }

    its([:text]) { should eq("Extracting moon minerals") }

    its([:title]) { should eq("Moon extraction") }
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

  describe "#duration" do
    context "when duration is present" do
      let(:duration) { double }

      before { expect(options).to receive(:[]).with("duration").and_return(duration) }

      specify { expect { subject.duration }.not_to raise_error }
    end

    context "when event_duration not present" do
      before { expect(options).to receive(:[]).with("duration").and_return(nil) }

      specify { expect { subject.duration }.not_to raise_error }
    end
  end

  describe "#event_id" do
    before { expect(options).to receive(:[]).with("event_id") }

    specify { expect { subject.event_id }.not_to raise_error }
  end

  describe "#importance" do
    before { expect(options).to receive(:[]).with("importance") }

    specify { expect { subject.importance }.not_to raise_error }
  end

  describe "#owner_id" do
    before { expect(options).to receive(:[]).with("owner_id") }

    specify { expect { subject.owner_id }.not_to raise_error }
  end

  describe "#owner_name" do
    before { expect(options).to receive(:[]).with("owner_name") }

    specify { expect { subject.owner_name }.not_to raise_error }
  end

  describe "#owner_type" do
    before { expect(options).to receive(:[]).with("owner_type") }

    specify { expect { subject.owner_type }.not_to raise_error }
  end

  describe "#event_response" do
    before { expect(options).to receive(:[]).with("response") }

    specify { expect { subject.event_response }.not_to raise_error }
  end

  describe "#text" do
    before { expect(options).to receive(:[]).with("text") }

    specify { expect { subject.text }.not_to raise_error }
  end

  describe "#title" do
    before { expect(options).to receive(:[]).with("title") }

    specify { expect { subject.title }.not_to raise_error }
  end
end
