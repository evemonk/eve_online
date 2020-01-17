# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MailRecipient do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:mail_recipient) { described_class.new(options) }

    before { expect(mail_recipient).to receive(:recipient_id).and_return(98_134_807) }

    before { expect(mail_recipient).to receive(:recipient_type).and_return("corporation") }

    subject { mail_recipient.as_json }

    its([:recipient_id]) { should eq(98_134_807) }

    its([:recipient_type]) { should eq("corporation") }
  end

  describe "#recipient_id" do
    before { expect(options).to receive(:[]).with("recipient_id") }

    specify { expect { subject.recipient_id }.not_to raise_error }
  end

  describe "#recipient_type" do
    before { expect(options).to receive(:[]).with("recipient_type") }

    specify { expect { subject.recipient_type }.not_to raise_error }
  end
end
