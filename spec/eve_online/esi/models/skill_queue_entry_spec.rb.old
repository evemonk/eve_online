# frozen_string_literal: true

require "spec_helper"

describe EveOnline::ESI::Models::SkillQueueEntry do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe "#initialize" do
    its(:options) { should eq(options) }
  end

  describe "#as_json" do
    let(:skill_queue_entry) { described_class.new(options) }

    let(:finish_date) { double }

    let(:start_date) { double }

    before { expect(skill_queue_entry).to receive(:finish_date).and_return(finish_date) }

    before { expect(skill_queue_entry).to receive(:finished_level).and_return(3) }

    before { expect(skill_queue_entry).to receive(:level_end_sp).and_return(40_000) }

    before { expect(skill_queue_entry).to receive(:level_start_sp).and_return(7_072) }

    before { expect(skill_queue_entry).to receive(:queue_position).and_return(49) }

    before { expect(skill_queue_entry).to receive(:skill_id).and_return(3_308) }

    before { expect(skill_queue_entry).to receive(:start_date).and_return(start_date) }

    before { expect(skill_queue_entry).to receive(:training_start_sp).and_return(7_072) }

    subject { skill_queue_entry.as_json }

    its([:finish_date]) { should eq(finish_date) }

    its([:finished_level]) { should eq(3) }

    its([:level_end_sp]) { should eq(40_000) }

    its([:level_start_sp]) { should eq(7_072) }

    its([:queue_position]) { should eq(49) }

    its([:skill_id]) { should eq(3_308) }

    its([:start_date]) { should eq(start_date) }

    its([:training_start_sp]) { should eq(7_072) }
  end

  describe "#finish_date" do
    context "when finish_date is present" do
      let(:finish_date) { double }

      before { expect(options).to receive(:[]).with("finish_date").and_return(finish_date) }

      before do
        #
        # subject.parse_datetime_with_timezone(finish_date)
        #
        expect(subject).to receive(:parse_datetime_with_timezone).with(finish_date)
      end

      specify { expect { subject.finish_date }.not_to raise_error }
    end

    context "when finish_date not present" do
      before { expect(options).to receive(:[]).with("finish_date").and_return(nil) }

      before { expect(subject).not_to receive(:parse_datetime_with_timezone) }

      specify { expect { subject.finish_date }.not_to raise_error }
    end
  end

  describe "#finished_level" do
    before { expect(options).to receive(:[]).with("finished_level") }

    specify { expect { subject.finished_level }.not_to raise_error }
  end

  describe "#level_end_sp" do
    before { expect(options).to receive(:[]).with("level_end_sp") }

    specify { expect { subject.level_end_sp }.not_to raise_error }
  end

  describe "#level_start_sp" do
    before { expect(options).to receive(:[]).with("level_start_sp") }

    specify { expect { subject.level_start_sp }.not_to raise_error }
  end

  describe "#queue_position" do
    before { expect(options).to receive(:[]).with("queue_position") }

    specify { expect { subject.queue_position }.not_to raise_error }
  end

  describe "#skill_id" do
    before { expect(options).to receive(:[]).with("skill_id") }

    specify { expect { subject.skill_id }.not_to raise_error }
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

  describe "#training_start_sp" do
    before { expect(options).to receive(:[]).with("training_start_sp") }

    specify { expect { subject.training_start_sp }.not_to raise_error }
  end
end
