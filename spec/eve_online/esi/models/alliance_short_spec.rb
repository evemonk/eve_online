# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::AllianceShort do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:alliance) { described_class.new(options) }

    before { expect(alliance).to receive(:alliance_id).and_return(99_005_443) }

    before { expect(alliance).to receive(:alliance_name).and_return("Kids With Guns Alliance") }

    subject { alliance.as_json }

    its([:alliance_id]) { should eq(99_005_443) }

    its([:alliance_name]) { should eq("Kids With Guns Alliance") }
  end

  describe "#alliance_id" do
    before { expect(options).to receive(:[]).with("alliance_id") }

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe "#alliance_name" do
    before { expect(options).to receive(:[]).with("alliance_name") }

    specify { expect { subject.alliance_name }.not_to raise_error }
  end
end
