# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CharacterCorporationHistory do
  let(:options) { {character_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/characters/%<character_id>s/corporationhistory/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe "#entries" do
    context "when @entries set" do
      let(:entries) { [instance_double(EveOnline::ESI::Models::CharacterCorporationHistory)] }

      before { subject.instance_variable_set(:@entries, :entries) }

      specify { expect(subject.entries).to eq(:entries) }
    end

    context "when @entries not set" do
      let(:entry) { instance_double(EveOnline::ESI::Models::CharacterCorporationHistory) }

      let(:response) do
        [
          {
            corporation_id: 1_000_168,
            is_deleted: nil,
            record_id: 16_785_803,
            start_date: "2011-05-10T10:23:00Z"
          }
        ]
      end

      before do
        #
        # subject.response # => [{"corporation_id"=>1000168, "is_deleted"=>nil, "record_id"=>16785803, "start_date"=>"2011-05-10T10:23:00Z"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::CharacterCorporationHistory.new(response.first) # => entry
        #
        expect(EveOnline::ESI::Models::CharacterCorporationHistory).to receive(:new).with(response.first).and_return(entry)
      end

      specify { expect(subject.entries).to eq([entry]) }

      specify { expect { subject.entries }.to change { subject.instance_variable_get(:@entries) }.from(nil).to([entry]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/characters/12345678/corporationhistory/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/characters/12345678/corporationhistory/")
    end
  end
end
