require 'spec_helper'

describe EveOnline::CharacterJumpCloneImplants do
  describe '#initialize' do
    let(:result) { double }

    subject { described_class.new(result) }

    its(:result) { should eq(result) }
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
      # rowset.fetch('@name') != 'jumpCloneImplants' => rowset
      #
      expect(rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('jumpCloneImplants').and_return(rowset)
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
  end
end
