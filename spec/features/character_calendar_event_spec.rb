# frozen_string_literal: true

require "spec_helper"

describe "Get character calendar event information" do
  let(:options) { {character_id: 91_473_836, event_id: 1_982_004} }

  before { VCR.insert_cassette "esi/character_calendar_events/91473836_1982004" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterCalendarEvent.new(options) }

  specify { expect(subject.scope).to eq("esi-calendar.read_calendar_events.v1") }

  specify do
    expect(subject.as_json).to eq(date: "2019-08-08T05:00:00Z",
      duration: 0,
      event_id: 1_982_004,
      importance: 1,
      owner_id: 91_473_836,
      owner_name: "Devas Weddo",
      owner_type: "character",
      event_response: "not_responded",
      text: "X marks the spot",
      title: "Important personal event")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(15) }
end
