require 'spec_helper'

describe EveOnline::XML::Models::SkillQueueEntry do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:skill_queue_entry) { described_class.new(options) }

    let(:start_time) { double }

    let(:end_time) { double }

    before { expect(skill_queue_entry).to receive(:queue_position).and_return(10) }

    before { expect(skill_queue_entry).to receive(:type_id).and_return(3_441) }

    before { expect(skill_queue_entry).to receive(:level).and_return(5) }

    before { expect(skill_queue_entry).to receive(:start_sp).and_return(226_275) }

    before { expect(skill_queue_entry).to receive(:end_sp).and_return(1_280_000) }

    before { expect(skill_queue_entry).to receive(:start_time).and_return(start_time) }

    before { expect(skill_queue_entry).to receive(:end_time).and_return(end_time) }

    subject { skill_queue_entry.as_json }

    its([:queue_position]) { should eq(10) }

    its([:type_id]) { should eq(3_441) }

    its([:level]) { should eq(5) }

    its([:start_sp]) { should eq(226_275) }

    its([:end_sp]) { should eq(1_280_000) }

    its([:start_time]) { should eq(start_time) }

    its([:end_time]) { should eq(end_time) }
  end

  describe '#queue_position' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@queuePosition').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@queuePosition') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.queue_position }.not_to raise_error }
  end

  describe '#type_id' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@typeID').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@typeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#level' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@level').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@level') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.level }.not_to raise_error }
  end

  describe '#start_sp' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@startSP').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@startSP') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.start_sp }.not_to raise_error }
  end

  describe '#end_sp' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('@endSP').to_i
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@endSP') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.end_sp }.not_to raise_error }
  end

  describe '#start_time' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:start_time) { double }

    before do
      #
      # subject.options.fetch('@startTime') => start_time
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@startTime').and_return(start_time)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(start_time)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(start_time)
        end
      end
    end

    specify { expect { subject.start_time }.not_to raise_error }
  end

  describe '#end_time' do
    let(:options) { double }

    subject { described_class.new(options) }

    let(:end_time) { double }

    before do
      #
      # subject.options.fetch('@endTime') => end_time
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@endTime').and_return(end_time)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(end_time)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(end_time)
        end
      end
    end

    specify { expect { subject.end_time }.not_to raise_error }
  end
end
