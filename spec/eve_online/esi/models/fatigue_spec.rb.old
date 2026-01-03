# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Fatigue do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:fatigue) { described_class.new(options) }

    let(:jump_fatigue_expire_date) { double }

    let(:last_jump_date) { double }

    let(:last_update_date) { double }

    before { expect(fatigue).to receive(:jump_fatigue_expire_date).and_return(jump_fatigue_expire_date) }

    before { expect(fatigue).to receive(:last_jump_date).and_return(last_jump_date) }

    before { expect(fatigue).to receive(:last_update_date).and_return(last_update_date) }

    subject { fatigue.as_json }

    its([:jump_fatigue_expire_date]) { should eq(jump_fatigue_expire_date) }

    its([:last_jump_date]) { should eq(last_jump_date) }

    its([:last_update_date]) { should eq(last_update_date) }
  end

  describe "#jump_fatigue_expire_date" do
    context "when jump_fatigue_expire_date is present" do
      let(:jump_fatigue_expire_date) { double }

      before { expect(options).to receive(:[]).with("jump_fatigue_expire_date").and_return(jump_fatigue_expire_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(jump_fatigue_expire_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(jump_fatigue_expire_date)
      end

      specify { expect { subject.jump_fatigue_expire_date }.not_to raise_error }
    end

    context "when jump_fatigue_expire_date not present" do
      before { expect(options).to receive(:[]).with("jump_fatigue_expire_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.jump_fatigue_expire_date }.not_to raise_error }
    end
  end

  describe "#last_jump_date" do
    context "when last_jump_date is present" do
      let(:last_jump_date) { double }

      before { expect(options).to receive(:[]).with("last_jump_date").and_return(last_jump_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(last_jump_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_jump_date)
      end

      specify { expect { subject.last_jump_date }.not_to raise_error }
    end

    context "when last_jump_date not present" do
      before { expect(options).to receive(:[]).with("last_jump_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_jump_date }.not_to raise_error }
    end
  end

  describe "#last_update_date" do
    context "when last_update_date is present" do
      let(:last_update_date) { double }

      before { expect(options).to receive(:[]).with("last_update_date").and_return(last_update_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(last_update_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_update_date)
      end

      specify { expect { subject.last_update_date }.not_to raise_error }
    end

    context "when last_update_date not present" do
      before { expect(options).to receive(:[]).with("last_update_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_update_date }.not_to raise_error }
    end
  end
end
