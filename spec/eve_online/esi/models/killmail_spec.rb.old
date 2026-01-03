# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Killmail do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:killmail) { described_class.new(options) }

    let(:killmail_time) { double }

    let(:moon_id) { double }

    let(:war_id) { double }

    before { expect(killmail).to receive(:killmail_id).and_return(81_646_519) }

    before { expect(killmail).to receive(:killmail_time).and_return(killmail_time) }

    before { expect(killmail).to receive(:moon_id).and_return(moon_id) }

    before { expect(killmail).to receive(:solar_system_id).and_return(30_003_493) }

    before { expect(killmail).to receive(:war_id).and_return(war_id) }

    subject { killmail.as_json }

    its([:killmail_id]) { should eq(81_646_519) }

    its([:killmail_time]) { should eq(killmail_time) }

    its([:moon_id]) { should eq(moon_id) }

    its([:solar_system_id]) { should eq(30_003_493) }

    its([:war_id]) { should eq(war_id) }
  end

  describe "#killmail_id" do
    before { expect(options).to receive(:[]).with("killmail_id") }

    specify { expect { subject.killmail_id }.not_to raise_error }
  end

  describe "#killmail_time" do
    context "when killmail_time is present" do
      let(:killmail_time) { double }

      before { expect(options).to receive(:[]).with("killmail_time").and_return(killmail_time) }

      before do
        #
        # subject.parse_datetime_with_timezone(killmail_time)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(killmail_time)
      end

      specify { expect { subject.killmail_time }.not_to raise_error }
    end

    context "when killmail_time not present" do
      before { expect(options).to receive(:[]).with("killmail_time").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.killmail_time }.not_to raise_error }
    end
  end

  describe "#moon_id" do
    before { expect(options).to receive(:[]).with("moon_id") }

    specify { expect { subject.moon_id }.not_to raise_error }
  end

  describe "#solar_system_id" do
    before { expect(options).to receive(:[]).with("solar_system_id") }

    specify { expect { subject.solar_system_id }.not_to raise_error }
  end

  describe "#war_id" do
    before { expect(options).to receive(:[]).with("war_id") }

    specify { expect { subject.war_id }.not_to raise_error }
  end
end
