# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::CharacterCorporationHistory do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:character_corporation_history) { described_class.new(options) }

    let(:is_deleted) { double }

    let(:start_date) { double }

    before { expect(character_corporation_history).to receive(:corporation_id).and_return(1_000_168) }

    before { expect(character_corporation_history).to receive(:is_deleted).and_return(is_deleted) }

    before { expect(character_corporation_history).to receive(:record_id).and_return(16_785_803) }

    before { expect(character_corporation_history).to receive(:start_date).and_return(start_date) }

    subject { character_corporation_history.as_json }

    its([:corporation_id]) { should eq(1_000_168) }

    its([:is_deleted]) { should eq(is_deleted) }

    its([:record_id]) { should eq(16_785_803) }

    its([:start_date]) { should eq(start_date) }
  end

  describe "#corporation_id" do
    before { expect(options).to receive(:[]).with("corporation_id") }

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe "#is_deleted" do
    before { expect(options).to receive(:[]).with("is_deleted") }

    specify { expect { subject.is_deleted }.not_to raise_error }
  end

  describe "#record_id" do
    before { expect(options).to receive(:[]).with("record_id") }

    specify { expect { subject.record_id }.not_to raise_error }
  end

  describe "#start_date" do
    context "when start_date is present" do
      let(:start_date) { double }

      before { expect(options).to receive(:[]).with("start_date").and_return(start_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(start_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(start_date)
      end

      specify { expect { subject.start_date }.not_to raise_error }
    end

    context "when start_date not present" do
      before { expect(options).to receive(:[]).with("start_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.start_date }.not_to raise_error }
    end
  end
end
