# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::UniverseSystemKills do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq("/v2/universe/system_kills/") }

  describe "#initialize" do
    its(:token) { should eq(nil) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:_write_timeout) { should eq(60) }
  end

  describe "#system_kills" do
    context "when @system_kills set" do
      let(:system_kills) { [instance_double(EveOnline::ESI::Models::SystemKill)] }

      before { subject.instance_variable_set(:@system_kills, system_kills) }

      specify { expect(subject.system_kills).to eq(system_kills) }
    end

    context "when @system_kills not set" do
      let(:system_kill) { instance_double(EveOnline::ESI::Models::SystemKill) }

      let(:response) do
        [
          {
            npc_kills: 231,
            pod_kills: 0,
            ship_kills: 0,
            system_id: 30_001_746
          }
        ]
      end

      before do
        #
        # subject.response # => [{"npc_kills"=>231, "pod_kills"=>0, "ship_kills"=>0, "system_id"=>30001746}]
        #
        expect(subject).to receive(:response).and_return(response)
      end

      before do
        #
        # EveOnline::ESI::Models::SystemKill.new(response.first) # => system_kill
        #
        expect(EveOnline::ESI::Models::SystemKill).to receive(:new).with(response.first).and_return(system_kill)
      end

      specify { expect(subject.system_kills).to eq([system_kill]) }

      specify { expect { subject.system_kills }.to change { subject.instance_variable_get(:@system_kills) }.from(nil).to([system_kill]) }
    end
  end

  describe "#scope" do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe "#path" do
    specify do
      expect(subject.path).to eq("/v2/universe/system_kills/")
    end
  end

  describe "#query" do
    specify do
      expect(subject.query).to eq({})
    end
  end

  describe "#url" do
    specify do
      expect(subject.url).to eq("https://esi.evetech.net/v2/universe/system_kills/")
    end
  end
end
