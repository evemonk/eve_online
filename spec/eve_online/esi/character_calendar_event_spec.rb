# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterCalendarEvent do
  let(:options) { {token: "token123", character_id: 91_473_836, event_id: 1_982_004} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v4/characters/%<character_id>s/calendar/%<event_id>s/") }

  describe "#initialize" do
    its(:token) { should eq("token123") }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(91_473_836) }

    its(:event_id) { should eq(1_982_004) }
  end

  describe "#model" do
    context "when @model set" do
      let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

      before { subject.instance_variable_set(:@model, model) }

      specify { expect(subject.model).to eq(model) }
    end

    context "when @model not set" do
      let(:response) { double }

      before { expect(subject).to receive(:response).and_return(response) }

      let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

      before do
        #
        # EveOnline::ESI::Models::EventDetails.new(response) # => model
        #
        expect(EveOnline::ESI::Models::EventDetails).to receive(:new).with(response).and_return(model)
      end

      specify { expect { subject.model }.not_to raise_error }

      specify { expect { subject.model }.to change { subject.instance_variable_get(:@model) }.from(nil).to(model) }
    end
  end

  describe "#as_json" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:as_json) }

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe "#date" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:date) }

    specify { expect { subject.date }.not_to raise_error }
  end

  describe "#duration" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:duration) }

    specify { expect { subject.duration }.not_to raise_error }
  end

  describe "#importance" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:importance) }

    specify { expect { subject.importance }.not_to raise_error }
  end

  describe "#owner_id" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:owner_id) }

    specify { expect { subject.owner_id }.not_to raise_error }
  end

  describe "#owner_name" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:owner_name) }

    specify { expect { subject.owner_name }.not_to raise_error }
  end

  describe "#owner_type" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:owner_type) }

    specify { expect { subject.owner_type }.not_to raise_error }
  end

  describe "#event_response" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:event_response) }

    specify { expect { subject.event_response }.not_to raise_error }
  end

  describe "#text" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:text) }

    specify { expect { subject.text }.not_to raise_error }
  end

  describe "#title" do
    let(:model) { instance_double(EveOnline::ESI::Models::EventDetails) }

    before { subject.instance_variable_set(:@model, model) }

    before { expect(model).to receive(:title) }

    specify { expect { subject.title }.not_to raise_error }
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq("esi-calendar.read_calendar_events.v1") }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v4/characters/91473836/calendar/1982004/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v4/characters/91473836/calendar/1982004/")
    end
  end
end
