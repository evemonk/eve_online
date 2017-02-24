require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::ESI::Models::Skill do
  describe '#initialize' do
    let(:options) { double }

    subject { described_class.new(options) }

    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:options) { double }

    let(:skill) { described_class.new(options) }

    before { expect(skill).to receive(:skill_id).and_return(22_536) }

    before { expect(skill).to receive(:skillpoints_in_skill).and_return(500) }

    before { expect(skill).to receive(:current_skill_level).and_return(1) }

    subject { skill.as_json }

    its([:skill_id]) { should eq(22_536) }

    its([:skillpoints_in_skill]) { should eq(500) }

    its([:current_skill_level]) { should eq(1) }
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

  describe '#skillpoints_in_skill' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('skillpoints_in_skill')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skillpoints_in_skill')
        end
      end
    end

    specify { expect { subject.skillpoints_in_skill }.not_to raise_error }
  end

  describe '#current_skill_level' do
    let(:options) { double }

    subject { described_class.new(options) }

    before do
      #
      # subject.options.fetch('current_skill_level')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('current_skill_level')
        end
      end
    end

    specify { expect { subject.current_skill_level }.not_to raise_error }
  end
end
