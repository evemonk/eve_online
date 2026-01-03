# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterCalendar do
  let(:options) { {token: "token123", character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/calendar/") }

  describe "#initialize" do
    context "without options" do
      its(:token) { should eq("token123") }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:_write_timeout) { should eq(60) }

      its(:character_id) { should eq(12_345_678) }

      its(:from_event) { should eq(nil) }
    end

    context "with options" do
      let(:options) do
        {
          token: "token123",
          character_id: 12_345_678,
          from_event: 123
        }
      end

      subject { described_class.new(options) }

      its(:from_event) { should eq(123) }
    end
  end

  describe "#events" do
    context "when @events set" do
      let(:events) { [instance_double(EveOnline::ESI::Models::Event)] }

      before { subject.instance_variable_set(:@events, events) }

      specify { expect(subject.events).to eq(events) }
    end

    context "when @events not set" do
      let(:event) { instance_double(EveOnline::ESI::Models::Event) }

      let(:response) do
        [
          {
            event_id: 1_635_247,
            event_date: "2018-03-05T15:00:59Z",
            title: "Moon extraction",
            importance: 0,
            event_response: "not_responded"
          }
        ]
      end

      before do
        #
        # subject.response # => [{"event_id"=>1635247, "event_date"=>"2018-03-05T15:00:59Z", "title"=>"Moon extraction", "importance"=>0, "event_response"=>"not_responded"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::Event.new(response.first) # => event
        #
        expect(EveOnline::ESI::Models::Event).to receive(:new).with(response.first).and_return(event)
      end

      specify { expect(subject.events).to eq([event]) }

      specify { expect { subject.events }.to change { subject.instance_variable_get(:@events) }.from(nil).to([event]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-calendar.read_calendar_events.v1") }
  end

  describe "#additional_query_params" do
    specify { expect(subject.additional_query_params).to eq([:from_event]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/calendar/")
    end
  end

  describe "#query" do
    context "without from_event" do
      specify do
        expect(subject.query).to eq({})
      end
    end

    context "with from_event" do
      let(:options) do
        {
          token: "token123",
          character_id: 12_345_678,
          from_event: 123
        }
      end

      subject { described_class.new(options) }

      specify do
        expect(subject.query).to eq(from_event: 123)
      end
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/calendar/")
    end
  end
end
