# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::SystemKill do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:system_kill) { described_class.new(options) }

    before { expect(system_kill).to receive(:npc_kills).and_return(231) }

    before { expect(system_kill).to receive(:pod_kills).and_return(0) }

    before { expect(system_kill).to receive(:ship_kills).and_return(0) }

    before { expect(system_kill).to receive(:system_id).and_return(30_001_746) }

    subject { system_kill.as_json }

    its([:npc_kills]) { should eq(231) }

    its([:pod_kills]) { should eq(0) }

    its([:ship_kills]) { should eq(0) }

    its([:system_id]) { should eq(30_001_746) }
  end

  describe "#npc_kills" do
    before { expect(options).to receive(:[]).with("npc_kills") }

    specify { expect { subject.npc_kills }.not_to raise_error }
  end

  describe "#pod_kills" do
    before { expect(options).to receive(:[]).with("pod_kills") }

    specify { expect { subject.pod_kills }.not_to raise_error }
  end

  describe "#ship_kills" do
    before { expect(options).to receive(:[]).with("ship_kills") }

    specify { expect { subject.ship_kills }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
  end
end
