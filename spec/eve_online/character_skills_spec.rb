require 'spec_helper'

describe EveOnline::CharacterSkills do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    let(:result) { double }

    subject { described_class.new(result) }

    its(:result) { should eq(result) }
  end

  describe '#skills' do
    let(:result) { double }

    subject { described_class.new(result) }

    let(:skill) { double }

    let(:rowset) do
      [
        {
          '@typeID' => '2495',
          '@skillpoints' => '1000',
          '@level' => '1',
          '@published' => '1'
        }
      ]
    end

    before do
      #
      # subject.rowset # => [{"@typeID"=>"2495", "@skillpoints"=>"1000", "@level"=>"1", "@published"=>"1"}]
      #
      expect(subject).to receive(:rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::Skill.new(rowset.first) # => skill
      #
      expect(EveOnline::Skill).to receive(:new).with(rowset.first).and_return(skill)
    end

    specify { expect(subject.skills).to eq([skill]) }

    specify { expect { subject.skills }.to change { subject.instance_variable_defined?(:@_memoized_skills) }.from(false).to(true) }
  end

  # private methods

  describe '#rowset' do
    let(:result) { double }

    subject { described_class.new(result) }

    let(:rowset) { double }

    before do
      #
      # subject.result.fetch('rowset').reject => rowset
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset') do
            double.tap do |b|
              expect(b).to receive(:reject).and_yield(rowset)
            end
          end
        end
      end
    end

    before do
      #
      # rowset.fetch('@name') != 'skills' => rowset
      #
      expect(rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('skills').and_return(rowset)
        end
      end
    end

    before do
      #
      # rowset.first.fetch('row')
      #
      expect(rowset).to receive(:first) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end
end
