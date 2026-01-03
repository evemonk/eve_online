# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::AsteroidBelt do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:asteroid_belt) { described_class.new(options) }

    before { expect(asteroid_belt).to receive(:name).and_return("Tanoo I - Asteroid Belt 1") }

    before { expect(asteroid_belt).to receive(:system_id).and_return(30_000_001) }

    subject { asteroid_belt.as_json }

    its([:name]) { should eq("Tanoo I - Asteroid Belt 1") }

    its([:system_id]) { should eq(30_000_001) }
  end

  describe "#name" do
    before { expect(options).to receive(:[]).with("name") }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe "#system_id" do
    before { expect(options).to receive(:[]).with("system_id") }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe "#position" do
    context "when @position set" do
      let(:position) { double }

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
