require 'spec_helper'

describe EveOnline::ESI::Models::SkillQueueEntry do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
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
    before { expect(options).to receive(:[]).with('skill_id') }

    specify { expect { subject.skill_id }.not_to raise_error }
  end

  describe '#finished_level' do
    before { expect(options).to receive(:[]).with('finished_level') }

    specify { expect { subject.finished_level }.not_to raise_error }
  end

  describe '#queue_position' do
    before { expect(options).to receive(:[]).with('queue_position') }

    specify { expect { subject.queue_position }.not_to raise_error }
  end

  describe '#finish_date' do
    let(:finish_date) { double }

    before { expect(options).to receive(:[]).with('finish_date').and_return(finish_date) }

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
    let(:start_date) { double }

    before { expect(options).to receive(:[]).with('start_date').and_return(start_date) }

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
    before { expect(options).to receive(:[]).with('training_start_sp') }

    specify { expect { subject.training_start_sp }.not_to raise_error }
  end

  describe '#level_end_sp' do
    before { expect(options).to receive(:[]).with('level_end_sp') }

    specify { expect { subject.level_end_sp }.not_to raise_error }
  end

  describe '#level_start_sp' do
    before { expect(options).to receive(:[]).with('level_start_sp') }

    specify { expect { subject.level_start_sp }.not_to raise_error }
  end
end
