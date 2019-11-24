# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::SystemJump do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:system_jump) { described_class.new(options) }

    before { expect(system_jump).to receive(:ship_jumps).and_return(22) }

    before { expect(system_jump).to receive(:system_id).and_return(30_005_327) }

    subject { system_jump.as_json }

    its([:ship_jumps]) { should eq(22) }

    its([:system_id]) { should eq(30_005_327) }
  end

  describe "#ship_jumps" do
    before { expect(options).to receive(:[]).with("ship_jumps") }

    specify { expect { subject.ship_jumps }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
  end
end
