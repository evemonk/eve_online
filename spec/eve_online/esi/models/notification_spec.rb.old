# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Notification do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:notification) { described_class.new(options) }

    let(:timestamp) { double }

    before { expect(notification).to receive(:is_read).and_return(true) }

    before { expect(notification).to receive(:notification_id).and_return(1) }

    before { expect(notification).to receive(:sender_id).and_return(1_000_132) }

    before { expect(notification).to receive(:sender_type).and_return("corporation") }

    before { expect(notification).to receive(:text).and_return('amount: 3731016.4000000004\\nitemID: 1024881021663\\npayout: 1\\n') }

    before { expect(notification).to receive(:timestamp).and_return(timestamp) }

    before { expect(notification).to receive(:type).and_return("InsurancePayoutMsg") }

    subject { notification.as_json }

    its([:is_read]) { should eq(true) }

    its([:notification_id]) { should eq(1) }

    its([:sender_id]) { should eq(1_000_132) }

    its([:sender_type]) { should eq("corporation") }

    its([:timestamp]) { should eq(timestamp) }

    its([:text]) { should eq('amount: 3731016.4000000004\\nitemID: 1024881021663\\npayout: 1\\n') }

    its([:type]) { should eq("InsurancePayoutMsg") }
  end

  describe "#is_read" do
    before { expect(options).to receive(:[]).with("is_read") }

    specify { expect { subject.is_read }.not_to raise_error }
  end

  describe "#notification_id" do
    before { expect(options).to receive(:[]).with("notification_id") }

    specify { expect { subject.notification_id }.not_to raise_error }
  end

  describe "#sender_id" do
    before { expect(options).to receive(:[]).with("sender_id") }

    specify { expect { subject.sender_id }.not_to raise_error }
  end

  describe "#sender_type" do
    before { expect(options).to receive(:[]).with("sender_type") }

    specify { expect { subject.sender_type }.not_to raise_error }
  end

  describe "#text" do
    before { expect(options).to receive(:[]).with("text") }

    specify { expect { subject.text }.not_to raise_error }
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

  describe "#type" do
    before { expect(options).to receive(:[]).with("type") }

    specify { expect { subject.type }.not_to raise_error }
  end
end
