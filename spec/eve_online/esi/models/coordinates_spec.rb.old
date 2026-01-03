# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Coordinates do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:coordinate) { described_class.new(options) }

    before { expect(coordinate).to receive(:x).and_return(-928_621_543_221.3319) }

    before { expect(coordinate).to receive(:y).and_return(297_645_715_142.40234) }

    before { expect(coordinate).to receive(:z).and_return(-971_212_198_300.4812) }

    subject { coordinate.as_json }

    its([:x]) { should eq(-928_621_543_221.3319) }

    its([:y]) { should eq(297_645_715_142.40234) }

    its([:z]) { should eq(-971_212_198_300.4812) }
  end

  describe "#x" do
    before { expect(options).to receive(:[]).with("x") }

    specify { expect { subject.x }.not_to raise_error }
  end

  describe "#y" do
    before { expect(options).to receive(:[]).with("y") }

    specify { expect { subject.y }.not_to raise_error }
  end

  describe "#z" do
    before { expect(options).to receive(:[]).with("z") }

    specify { expect { subject.z }.not_to raise_error }
  end
end
