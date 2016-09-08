require 'spec_helper'

describe EveOnline::Characters::Blueprints do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/Blueprints.xml.aspx') }

  specify { expect(described_class::ACCESS_MASK).to eq(2) }

  describe '#initialize' do
    let(:parser) { double }

    before do
      #
      # Nori.new(advanced_typecasting: false) => double
      #
      expect(Nori).to receive(:new).with(advanced_typecasting: false).and_return(parser)
    end

    its(:parser) { should eq(parser) }

    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#blueprints' do
    context 'row is Hash' do
      let(:blueprint) { double }

      let(:row) do
        {
          '@itemID' => '716338097',
          '@locationID' => '61000032',
          '@typeID' => '1010',
          '@typeName' => 'Small Shield Extender I Blueprint',
          '@flagID' => '4',
          '@quantity' => '-2',
          '@timeEfficiency' => '0',
          '@materialEfficiency' => '10',
          '@runs' => '300'
        }
      end

      before do
        #
        # subject.row # => {"@itemID"=>"716338097", "@locationID"=>"61000032", "@typeID"=>"1010", "@typeName"=>"Small Shield Extender I Blueprint", "@flagID"=>"4", "@quantity"=>"-2", "@timeEfficiency"=>"0", "@materialEfficiency"=>"10", "@runs"=>"300"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Blueprint.new(row) # => blueprint
        #
        expect(EveOnline::Blueprint).to receive(:new).with(row).and_return(blueprint)
      end

      specify { expect(subject.blueprints).to eq([blueprint]) }

      specify { expect { subject.blueprints }.to change { subject.instance_variable_defined?(:@_memoized_blueprints) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:blueprint) { double }

      let(:row) do
        [
          {
            '@itemID' => '716338097',
            '@locationID' => '61000032',
            '@typeID' => '1010',
            '@typeName' => 'Small Shield Extender I Blueprint',
            '@flagID' => '4',
            '@quantity' => '-2',
            '@timeEfficiency' => '0',
            '@materialEfficiency' => '10',
            '@runs' => '300'
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@itemID"=>"716338097", "@locationID"=>"61000032", "@typeID"=>"1010", "@typeName"=>"Small Shield Extender I Blueprint", "@flagID"=>"4", "@quantity"=>"-2", "@timeEfficiency"=>"0", "@materialEfficiency"=>"10", "@runs"=>"300"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Blueprint.new(row.first) # => blueprint
        #
        expect(EveOnline::Blueprint).to receive(:new).with(row.first).and_return(blueprint)
      end

      specify { expect(subject.blueprints).to eq([blueprint]) }

      specify { expect { subject.blueprints }.to change { subject.instance_variable_defined?(:@_memoized_blueprints) }.from(false).to(true) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.blueprints }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }")
    end
  end

  # private methods

  describe '#rowset' do
    before do
      #
      # subject.result.fetch('rowset')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end

  describe '#row' do
    before do
      #
      # subject.rowset.fetch('row')
      #
      expect(subject).to receive(:rowset) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('row')
        end
      end
    end

    specify { expect { subject.send(:row) }.not_to raise_error }

    specify { expect { subject.send(:row) }.to change { subject.instance_variable_defined?(:@_memoized_row) }.from(false).to(true) }
  end
end
