# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::CorporationAllianceHistory do
  let(:options) { {corporation_id: 12_345_678} }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/corporations/%<corporation_id>s/alliancehistory/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe "#entries" do
    context "when @entries set" do
      let(:entries) { [instance_double(EveOnline::ESI::Models::CorporationAllianceHistory)] }

      before { subject.instance_variable_set(:@entries, :entries) }

      specify { expect(subject.entries).to eq(:entries) }
    end

    context "when @entries not set" do
      let(:entry) { instance_double(EveOnline::ESI::Models::CorporationAllianceHistory) }

      let(:response) do
        [
          {
            alliance_id: 99_005_874,
            record_id: 1_254_640,
            start_date: "2019-06-03T00:17:00Z"
          }
        ]
      end

      before do
        #
        # subject.response # => [{"alliance_id"=>99005874, "record_id"=>1254640, "start_date"=>"2019-06-03T00:17:00Z"}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::CorporationAllianceHistory.new(response.first) # => entry
        #
        expect(EveOnline::ESI::Models::CorporationAllianceHistory).to receive(:new).with(response.first).and_return(entry)
      end

      specify { expect(subject.entries).to eq([entry]) }

      specify { expect { subject.entries }.to change { subject.instance_variable_get(:@entries) }.from(nil).to([entry]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#roles" do
    specify { expect(subject.roles).to eq([]) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/corporations/12345678/alliancehistory/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/corporations/12345678/alliancehistory/")
    end
  end
end
