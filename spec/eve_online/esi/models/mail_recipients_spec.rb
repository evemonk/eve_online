# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::MailRecipients do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#mail_recipients" do
    # TODO: one more spec for case when options is not array
    let(:mail_recipient) { instance_double(EveOnline::ESI::Models::MailRecipient) }

    let(:option) { double }

    let(:options) { [option] }

    before { expect(EveOnline::ESI::Models::MailRecipient).to receive(:new).with(option).and_return(mail_recipient) }

    before { expect(subject.mail_recipients).to eq([mail_recipient]) }
  end
end
