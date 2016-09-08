require 'spec_helper'

describe EveOnline::CharacterJumpCloneImplants do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    let(:result) { double }

    subject { described_class.new(result) }

    its(:result) { should eq(result) }
  end

  describe '#jump_clone_implants' do
    let(:result) { double }

    subject { described_class.new(result) }

    let(:jump_clone_implant) { double }

    let(:rowset) do
      [
        {
          '@jumpCloneID' => '22703029',
          '@typeID' => '10209',
          '@typeName' => 'Memory Augmentation - Improved'
        }
      ]
    end

    before do
      #
      # subject.rowset # => [{"@jumpCloneID"=>"22703029", "@typeID"=>"10209", "@typeName"=>"Memory Augmentation - Improved"}]
      #
      expect(subject).to receive(:rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::JumpCloneImplant.new(rowset.first) # => jump_clone_implant
      #
      expect(EveOnline::JumpCloneImplant).to receive(:new).with(rowset.first).and_return(jump_clone_implant)
    end

    specify { expect(subject.jump_clone_implants).to eq([jump_clone_implant]) }

    specify { expect { subject.jump_clone_implants }.to change { subject.instance_variable_defined?(:@_memoized_jump_clone_implants) }.from(false).to(true) }
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

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end
end
