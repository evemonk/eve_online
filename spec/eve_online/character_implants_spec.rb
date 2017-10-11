require 'spec_helper'

describe EveOnline::CharacterImplants do
  specify { expect(described_class).to be_a(Memoist) }

  describe '#initialize' do
    let(:result) { double }

    subject { described_class.new(result) }

    its(:result) { should eq(result) }
  end

  describe '#implants' do
    let(:result) { double }

    subject { described_class.new(result) }

    let(:implant) { double }

    let(:rowset) do
      [
        {
          '@typeID' => '9899',
          '@typeName' => 'Ocular Filter - Basic'
        }
      ]
    end

    before do
      #
      # subject.rowset # => [{"@typeID"=>"9899", "@typeName"=>"Ocular Filter - Basic"}]
      #
      expect(subject).to receive(:rowset).and_return(rowset)
    end

    before do
      #
      # EveOnline::Implant.new(rowset.first) # => implant
      #
      expect(EveOnline::Implant).to receive(:new).with(rowset.first).and_return(implant)
    end

    specify { expect(subject.implants).to eq([implant]) }

    specify { expect { subject.implants }.to change { subject.instance_variable_defined?(:@_memoized_implants) }.from(false).to(true) }
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
      # rowset.fetch('@name') != 'implants' => rowset
      #
      expect(rowset).to receive(:fetch).with('@name') do
        double.tap do |a|
          expect(a).to receive(:!=).with('implants').and_return(rowset)
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
