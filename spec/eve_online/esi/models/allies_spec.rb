# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Allies do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#allies" do
    context "when options is array" do
      let(:ally) { double }

      let(:option) { double }

      let(:options) { [option] }

      before { expect(EveOnline::ESI::Models::Ally).to receive(:new).with(option).and_return(ally) }

      specify { expect(subject.allies).to eq([ally]) }
    end

    context "when options is nil" do
      let(:options) { nil }

      specify { expect(subject.allies).to eq([]) }
    end
  end
end
