require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::Models::SkillQueueEntry do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:skill_queue_entry) { described_class.new(options) }

    let(:finish_date) { double }

    let(:start_date) { double }

    before { expect(skill_queue_entry).to receive(:skill_id).and_return(3_308) }

    before { expect(skill_queue_entry).to receive(:finished_level).and_return(3) }

    before { expect(skill_queue_entry).to receive(:queue_position).and_return(49) }

    before { expect(skill_queue_entry).to receive(:finish_date).and_return(finish_date) }

    before { expect(skill_queue_entry).to receive(:start_date).and_return(start_date) }

    before { expect(skill_queue_entry).to receive(:training_start_sp).and_return(7_072) }

    before { expect(skill_queue_entry).to receive(:level_end_sp).and_return(40_000) }

    before { expect(skill_queue_entry).to receive(:level_start_sp).and_return(7_072) }

    subject { skill_queue_entry.as_json }

    its([:skill_id]) { should eq(3_308) }

    its([:finished_level]) { should eq(3) }

    its([:queue_position]) { should eq(49) }

    its([:finish_date]) { should eq(finish_date) }

    its([:start_date]) { should eq(start_date) }

    its([:training_start_sp]) { should eq(7_072) }

    its([:level_end_sp]) { should eq(40_000) }

    its([:level_start_sp]) { should eq(7_072) }
  end

  describe '#skill_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('skill_id')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skill_id')
        end
      end
    end

    specify { expect { subject.skill_id }.not_to raise_error }
  end

  describe '#finished_level' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('finished_level')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('finished_level')
        end
      end
    end

    specify { expect { subject.finished_level }.not_to raise_error }
  end

  describe '#queue_position' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('queue_position')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('queue_position')
        end
      end
    end

    specify { expect { subject.queue_position }.not_to raise_error }
  end

  describe '#finish_date' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:finish_date) { double }

    before do
      #
      # subject.options.fetch('finish_date') => finish_date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('finish_date').and_return(finish_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(finish_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(finish_date)
        end
      end
    end

    specify { expect { subject.finish_date }.not_to raise_error }
  end

  describe '#start_date' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:start_date) { double }

    before do
      #
      # subject.options.fetch('start_date') => start_date
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('start_date').and_return(start_date)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(start_date)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(start_date)
        end
      end
    end

    specify { expect { subject.start_date }.not_to raise_error }
  end

  describe '#training_start_sp' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('training_start_sp')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('training_start_sp')
        end
      end
    end

    specify { expect { subject.training_start_sp }.not_to raise_error }
  end

  describe '#level_end_sp' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('level_end_sp')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('level_end_sp')
        end
      end
    end

    specify { expect { subject.level_end_sp }.not_to raise_error }
  end

  describe '#level_start_sp' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('level_start_sp')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('level_start_sp')
        end
      end
    end

    specify { expect { subject.level_start_sp }.not_to raise_error }
  end
end
