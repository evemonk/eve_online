# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Stargate do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:stargate) { described_class.new(options) }

    before { expect(stargate).to receive(:name).and_return("Stargate (Akpivem)") }

    before { expect(stargate).to receive(:stargate_id).and_return(50_000_056) }

    before { expect(stargate).to receive(:system_id).and_return(30_000_001) }

    before { expect(stargate).to receive(:type_id).and_return(29_624) }

    before { expect(stargate).to receive(:destination_stargate_id).and_return(50_000_342) }

    before { expect(stargate).to receive(:destination_system_id).and_return(30_000_003) }

    subject { stargate.as_json }

    its([:name]) { should eq("Stargate (Akpivem)") }

    its([:stargate_id]) { should eq(50_000_056) }

    its([:system_id]) { should eq(30_000_001) }

    its([:type_id]) { should eq(29_624) }

    its([:destination_stargate_id]) { should eq(50_000_342) }

    its([:destination_system_id]) { should eq(30_000_003) }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#stargate_id" do
    before { expect(options).to receive(:[]).with("stargate_id") }

    specify { expect { subject.stargate_id }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe "#type_id" do
    before { expect(options).to receive(:[]).with("type_id") }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe "#destination_stargate_id" do
    before { expect(options).to receive(:dig).with("destination", "stargate_id") }

    specify { expect { subject.destination_stargate_id }.not_to raise_error }
  end

  describe "#destination_system_id" do
    before { expect(options).to receive(:dig).with("destination", "system_id") }

    specify { expect { subject.destination_system_id }.not_to raise_error }
  end

  describe "#position" do
    context "when @position set" do
      let(:position) { instance_double(EveOnline::ESI::Models::Position) }

      before { subject.instance_variable_set(:@position, position) }

      specify { expect(subject.position).to eq(position) }
    end

    context "when @position not set" do
      let(:position) { double }

      let(:options) { {"position" => position} }

      let(:model) { instance_double(EveOnline::ESI::Models::Position) }

      before { expect(EveOnline::ESI::Models::Position).to receive(:new).with(position).and_return(model) }

      specify { expect { subject.position }.not_to raise_error }

      specify { expect { subject.position }.to change { subject.instance_variable_get(:@position) }.from(nil).to(model) }
    end
  end
end
