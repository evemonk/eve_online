# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterCalendar do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/characters/%<character_id>s/calendar/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#events' do
    let(:event) { double }

    let(:response) do
      [
        {
          event_id: 1_635_247,
          event_date: '2018-03-05T15:00:59Z',
          title: 'Moon extraction',
          importance: 0,
          event_response: 'not_responded'
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

    specify { expect { subject.events }.to change { subject.instance_variable_defined?(:@_memoized_events) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-calendar.read_calendar_events.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/characters/12345678/calendar/?datasource=tranquility')
    end
  end
end
