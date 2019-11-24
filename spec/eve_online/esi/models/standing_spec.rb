# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Standing do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:standing) { described_class.new(options) }

    before { expect(standing).to receive(:from_id).and_return(500_001) }

    before { expect(standing).to receive(:from_type).and_return("faction") }

    before { expect(standing).to receive(:standing).and_return(0.3303719111639991) }

    subject { standing.as_json }

    its([:from_id]) { should eq(500_001) }

    its([:from_type]) { should eq("faction") }

    its([:standing]) { should eq(0.3303719111639991) }
  end

  describe "#from_id" do
    before { expect(options).to receive(:[]).with("from_id") }

    specify { expect { subject.from_id }.not_to raise_error }
  end

  describe "#from_type" do
    before { expect(options).to receive(:[]).with("from_type") }

    specify { expect { subject.from_type }.not_to raise_error }
  end

  describe "#standing" do
    before { expect(options).to receive(:[]).with("standing") }

    specify { expect { subject.standing }.not_to raise_error }
  end
end
