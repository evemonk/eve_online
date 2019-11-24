# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::KillmailShort do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:killmail) { described_class.new(options) }

    before { expect(killmail).to receive(:killmail_hash).and_return("07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5") }

    before { expect(killmail).to receive(:killmail_id).and_return(72_410_059) }

    subject { killmail.as_json }

    its([:killmail_hash]) { should eq("07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5") }

    its([:killmail_id]) { should eq(72_410_059) }
  end

  describe "#killmail_hash" do
    before { expect(options).to receive(:[]).with("killmail_hash") }

    specify { expect { subject.killmail_hash }.not_to raise_error }
  end

  describe "#killmail_id" do
    before { expect(options).to receive(:[]).with("killmail_id") }

    specify { expect { subject.killmail_id }.not_to raise_error }
  end
end
