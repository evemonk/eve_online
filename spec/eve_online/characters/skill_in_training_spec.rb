require 'spec_helper'

describe EveOnline::Characters::SkillInTraining do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/SkillInTraining.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
    let(:skill_in_training) { described_class.new(key_id, v_code, character_id) }

    let(:current_tq_time) { double }

    let(:training_end_time) { double }

    let(:training_start_time) { double }

    before { expect(skill_in_training).to receive(:current_tq_time).and_return(current_tq_time) }

    before { expect(skill_in_training).to receive(:training_end_time).and_return(training_end_time) }

    before { expect(skill_in_training).to receive(:training_start_time).and_return(training_start_time) }

    before { expect(skill_in_training).to receive(:training_type_id).and_return(30_651) }

    before { expect(skill_in_training).to receive(:training_start_sp).and_return(226_275) }

    before { expect(skill_in_training).to receive(:training_destination_sp).and_return(1_280_000) }

    before { expect(skill_in_training).to receive(:training_to_level).and_return(5) }

    before { expect(skill_in_training).to receive(:skill_in_training).and_return(1) }

    subject { skill_in_training.as_json }

    its([:current_tq_time]) { should eq(current_tq_time) }

    its([:training_end_time]) { should eq(training_end_time) }

    its([:training_start_time]) { should eq(training_start_time) }

    its([:training_type_id]) { should eq(30_651) }

    its([:training_start_sp]) { should eq(226_275) }

    its([:training_destination_sp]) { should eq(1_280_000) }

    its([:training_to_level]) { should eq(5) }

    its([:skill_in_training]) { should eq(1) }
  end

  describe '#current_tq_time' do
    let(:currentTQTime) { double }

    before do
      #
      # subject.result.fetch('currentTQTime') => currentTQTime
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('currentTQTime').and_return(currentTQTime)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(currentTQTime)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(currentTQTime)
        end
      end
    end

    specify { expect { subject.current_tq_time }.not_to raise_error }
  end

  describe '#training_end_time' do
    let(:trainingEndTime) { double }

    before do
      #
      # subject.result.fetch('trainingEndTime') => trainingEndTime
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingEndTime').and_return(trainingEndTime)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(trainingEndTime)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(trainingEndTime)
        end
      end
    end

    specify { expect { subject.training_end_time }.not_to raise_error }
  end

  describe '#training_start_time' do
    let(:trainingStartTime) { double }

    before do
      #
      # subject.result.fetch('trainingStartTime') => trainingStartTime
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingStartTime').and_return(trainingStartTime)
        end
      end
    end

    before do
      #
      # ActiveSupport::TimeZone['UTC'].parse(trainingStartTime)
      #
      expect(ActiveSupport::TimeZone).to receive(:[]).with('UTC') do
        double.tap do |a|
          expect(a).to receive(:parse).with(trainingStartTime)
        end
      end
    end

    specify { expect { subject.training_start_time }.not_to raise_error }
  end

  describe '#training_type_id' do
    before do
      #
      # subject.result.fetch('trainingTypeID').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingTypeID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.training_type_id }.not_to raise_error }
  end

  describe '#training_start_sp' do
    before do
      #
      # subject.result.fetch('trainingStartSP').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingStartSP') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.training_start_sp }.not_to raise_error }
  end

  describe '#training_destination_sp' do
    before do
      #
      # subject.result.fetch('trainingDestinationSP').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingDestinationSP') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.training_destination_sp }.not_to raise_error }
  end

  describe '#training_to_level' do
    before do
      #
      # subject.result.fetch('trainingToLevel').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('trainingToLevel') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.training_to_level }.not_to raise_error }
  end

  describe '#skill_in_training' do
    before do
      #
      # subject.result.fetch('skillInTraining').to_i
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('skillInTraining') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.skill_in_training }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end
end
