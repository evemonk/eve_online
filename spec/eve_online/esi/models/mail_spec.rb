# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Mail do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:mail) { described_class.new(options) }

    let(:read) { double }

    let(:timestamp) { double }

    before { expect(mail).to receive(:body).and_return("<font size=\"12\" color=\"#bfffffff\">moving</font>") }

    before { expect(mail).to receive(:from_id).and_return(1_208_274_826) }

    before { expect(mail).to receive(:read).and_return(read) }

    before { expect(mail).to receive(:subject).and_return("moving") }

    before { expect(mail).to receive(:timestamp).and_return(timestamp) }

    subject { mail.as_json }

    its([:body]) { should eq("<font size=\"12\" color=\"#bfffffff\">moving</font>") }

    its([:from_id]) { should eq(1_208_274_826) }

    its([:read]) { should eq(read) }

    its([:subject]) { should eq("moving") }

    its([:timestamp]) { should eq(timestamp) }
  end

  describe "#body" do
    before { expect(options).to receive(:[]).with("body") }

    specify { expect { subject.body }.not_to raise_error }
  end

  describe "#from_id" do
    before { expect(options).to receive(:[]).with("from") }

    specify { expect { subject.from_id }.not_to raise_error }
  end

  describe "#read" do
    before { expect(options).to receive(:[]).with("read") }

    specify { expect { subject.read }.not_to raise_error }
  end

  describe "#subject" do
    before { expect(options).to receive(:[]).with("subject") }

    specify { expect { subject.subject }.not_to raise_error }
  end

  describe "#timestamp" do
    context "when timestamp is present" do
      let(:timestamp) { double }

      before { expect(options).to receive(:[]).with("timestamp").and_return(timestamp) }

      before do
        #
        # subject.parse_datetime_with_timezone(timestamp)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(timestamp)
      end

      specify { expect { subject.timestamp }.not_to raise_error }
    end

    context "when timestamp not present" do
      before { expect(options).to receive(:[]).with("timestamp").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.timestamp }.not_to raise_error }
    end
  end

  describe "#label_ids" do
    before { expect(options).to receive(:[]).with("labels") }

    specify { expect { subject.label_ids }.not_to raise_error }
  end

  describe "#recipients" do
    context "when @recipients set" do
      let(:recipients) { double }

      before { subject.instance_variable_set(:@recipients, recipients) }

      specify { expect(subject.recipients).to eq(recipients) }
    end

    context "when @recipients not set" do
      let(:option) { double }

      let(:options) { {"recipients" => option} }

      let(:recipients) { instance_double(EveOnline::ESI::Models::MailRecipients) }

      let(:output) { double }

      before { expect(EveOnline::ESI::Models::MailRecipients).to receive(:new).with(option).and_return(recipients) }

      before { expect(recipients).to receive(:mail_recipients).and_return(output) }

      specify { expect { subject.recipients }.not_to raise_error }

      specify { expect { subject.recipients }.to change { subject.instance_variable_get(:@recipients) }.from(nil).to(output) }
    end
  end
end
