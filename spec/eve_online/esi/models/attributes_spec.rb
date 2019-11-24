# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::Attributes do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:attributes) { described_class.new(options) }

    let(:accrued_remap_cooldown_date) { double }

    let(:last_remap_date) { double }

    before { expect(attributes).to receive(:accrued_remap_cooldown_date).and_return(accrued_remap_cooldown_date) }

    before { expect(attributes).to receive(:bonus_remaps).and_return(2) }

    before { expect(attributes).to receive(:charisma).and_return(20) }

    before { expect(attributes).to receive(:intelligence).and_return(25) }

    before { expect(attributes).to receive(:last_remap_date).and_return(last_remap_date) }

    before { expect(attributes).to receive(:memory).and_return(24) }

    before { expect(attributes).to receive(:perception).and_return(23) }

    before { expect(attributes).to receive(:willpower).and_return(22) }

    subject { attributes.as_json }

    its([:accrued_remap_cooldown_date]) { should eq(accrued_remap_cooldown_date) }

    its([:bonus_remaps]) { should eq(2) }

    its([:charisma]) { should eq(20) }

    its([:intelligence]) { should eq(25) }

    its([:last_remap_date]) { should eq(last_remap_date) }

    its([:memory]) { should eq(24) }

    its([:perception]) { should eq(23) }

    its([:willpower]) { should eq(22) }
  end

  describe "#accrued_remap_cooldown_date" do
    context "when accrued_remap_cooldown_date is present" do
      let(:accrued_remap_cooldown_date) { double }

      before { expect(options).to receive(:[]).with("accrued_remap_cooldown_date").and_return(accrued_remap_cooldown_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(accrued_remap_cooldown_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(accrued_remap_cooldown_date)
      end

      specify { expect { subject.accrued_remap_cooldown_date }.not_to raise_error }
    end

    context "when accrued_remap_cooldown_date not present" do
      before { expect(options).to receive(:[]).with("accrued_remap_cooldown_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.accrued_remap_cooldown_date }.not_to raise_error }
    end
  end

  describe "#bonus_remaps" do
    before { expect(options).to receive(:[]).with("bonus_remaps") }

    specify { expect { subject.bonus_remaps }.not_to raise_error }
  end

  describe "#charisma" do
    before { expect(options).to receive(:[]).with("charisma") }

    specify { expect { subject.charisma }.not_to raise_error }
  end

  describe "#intelligence" do
    before { expect(options).to receive(:[]).with("intelligence") }

    specify { expect { subject.intelligence }.not_to raise_error }
  end

  describe "#last_remap_date" do
    context "when last_remap_date is present" do
      let(:last_remap_date) { double }

      before { expect(options).to receive(:[]).with("last_remap_date").and_return(last_remap_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(last_remap_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(last_remap_date)
      end

      specify { expect { subject.last_remap_date }.not_to raise_error }
    end

    context "when last_remap_date not present" do
      before { expect(options).to receive(:[]).with("last_remap_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.last_remap_date }.not_to raise_error }
    end
  end

  describe "#memory" do
    before { expect(options).to receive(:[]).with("memory") }

    specify { expect { subject.memory }.not_to raise_error }
  end

  describe "#perception" do
    before { expect(options).to receive(:[]).with("perception") }

    specify { expect { subject.perception }.not_to raise_error }
  end

  describe "#willpower" do
    before { expect(options).to receive(:[]).with("willpower") }

    specify { expect { subject.willpower }.not_to raise_error }
  end
end
