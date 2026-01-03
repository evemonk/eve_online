# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Online do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:online) { described_class.new(options) }

    let(:last_login) { double }

    let(:last_logout) { double }

    before { expect(online).to receive(:last_login).and_return(last_login) }

    before { expect(online).to receive(:last_logout).and_return(last_logout) }

    before { expect(online).to receive(:logins).and_return(370) }

    before { expect(online).to receive(:online).and_return(true) }

    subject { online.as_json }

    its([:last_login]) { should eq(last_login) }

    its([:last_logout]) { should eq(last_logout) }

    its([:logins]) { should eq(370) }

    its([:online]) { should eq(true) }
  end

  describe "#last_login" do
    context "when last_login is present" do
      let(:last_login) { double }

      before { expect(options).to receive(:[]).with("last_login").and_return(last_login) }

      before do
        #
        # subject.parse_datetime_with_timezone(last_login)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_login)
      end

      specify { expect { subject.last_login }.not_to raise_error }
    end

    context "when last_login not present" do
      before { expect(options).to receive(:[]).with("last_login").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_login }.not_to raise_error }
    end
  end

  describe "#last_logout" do
    context "when last_logout is present" do
      let(:last_logout) { double }

      before { expect(options).to receive(:[]).with("last_logout").and_return(last_logout) }

      before do
        #
        # subject.parse_datetime_with_timezone(last_logout)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_logout)
      end

      specify { expect { subject.last_logout }.not_to raise_error }
    end

    context "when last_logout not present" do
      before { expect(options).to receive(:[]).with("last_logout").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_logout }.not_to raise_error }
    end
  end

  describe "#logins" do
    before { expect(options).to receive(:[]).with("logins") }

    specify { expect { subject.logins }.not_to raise_error }
  end

  describe "#online" do
    before { expect(options).to receive(:[]).with("online") }

    specify { expect { subject.online }.not_to raise_error }
  end
end
