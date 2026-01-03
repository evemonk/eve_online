# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::ServerStatus do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:server_status) { described_class.new(options) }

    let(:start_time) { double }

    before { expect(server_status).to receive(:players).and_return(34_545) }

    before { expect(server_status).to receive(:server_version).and_return(1_135_520) }

    before { expect(server_status).to receive(:start_time).and_return(start_time) }

    before { expect(server_status).to receive(:vip).and_return(false) }

    subject { server_status.as_json }

    its([:players]) { should eq(34_545) }

    its([:server_version]) { should eq(1_135_520) }

    its([:start_time]) { should eq(start_time) }

    its([:vip]) { should eq(false) }
  end

  describe "#players" do
    before { expect(options).to receive(:[]).with("players") }

    specify { expect { subject.players }.not_to raise_error }
  end

  describe "#server_version" do
    before { expect(options).to receive(:[]).with("server_version") }

    specify { expect { subject.server_version }.not_to raise_error }
  end

  describe "#start_time" do
    context "when start_time is present" do
      let(:start_time) { double }

      before { expect(options).to receive(:[]).with("start_time").and_return(start_time) }

      before do
        #
        # subject.parse_datetime_with_timezone(start_time)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(start_time)
      end

      specify { expect { subject.start_time }.not_to raise_error }
    end

    context "when start_time not present" do
      before { expect(options).to receive(:[]).with("start_time").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.start_time }.not_to raise_error }
    end
  end

  describe "#vip" do
    before { expect(options).to receive(:[]).with("vip") }

    specify { expect { subject.vip }.not_to raise_error }
  end
end
