# frozen_string_literal: true

require 'spec_helper'

describe 'Get character calendar event information' do
  context 'when etag not set' do
    let(:options) { { character_id: 91_473_836, event_id: 1_982_004 } }

    before { VCR.insert_cassette 'esi/character_calendar_events/91473836_1982004' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterCalendarEvent.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq('esi-calendar.read_calendar_events.v1') }

    specify do
      expect(subject.as_json).to eq(date: '2019-08-08T05:00:00Z',
                                    duration: 0,
                                    event_id: 1_982_004,
                                    importance: 1,
                                    owner_id: 91_473_836,
                                    owner_name: 'Devas Weddo',
                                    owner_type: 'character',
                                    response: 'not_responded',
                                    text: 'X marks the spot',
                                    title: 'Important personal event')
    end

    specify { expect(subject.etag).to eq('551811618f893135bfda67bc87f2a2215a6d648b2374bac6194744e4') }
  end

  context 'when etag is set' do
    let(:options) do
      {
        character_id: 91_473_836,
        event_id: 1_982_004,
        etag: '551811618f893135bfda67bc87f2a2215a6d648b2374bac6194744e4'
      }
    end

    before { VCR.insert_cassette 'esi/character_calendar_events/91473836_1982004_with_etag' }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::CharacterCalendarEvent.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq('551811618f893135bfda67bc87f2a2215a6d648b2374bac6194744e4') }
  end
end
