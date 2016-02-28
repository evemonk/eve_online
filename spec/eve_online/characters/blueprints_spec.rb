require 'spec_helper'

describe EveOnline::Characters::Blueprints do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12345678 }

  subject { described_class.new(key_id, v_code, character_id) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/Blueprints.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#blueprints' do
    context 'row is Hash' do
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
          '@runs'=>'300'
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
        # EveOnline::Blueprint.new(row)
        #
        expect(EveOnline::Blueprint).to receive(:new).with(row)
      end

      specify { expect { subject.blueprints }.not_to raise_error }
    end

    context 'row is Array' do
      let(:row) do
        [{
           '@itemID' => '716338097',
           '@locationID' => '61000032',
           '@typeID' => '1010',
           '@typeName' => 'Small Shield Extender I Blueprint',
           '@flagID' => '4',
           '@quantity' => '-2',
           '@timeEfficiency' => '0',
           '@materialEfficiency' => '10',
           '@runs'=>'300'
         }]
      end

      before do
        #
        # subject.row # => [{"@itemID"=>"716338097", "@locationID"=>"61000032", "@typeID"=>"1010", "@typeName"=>"Small Shield Extender I Blueprint", "@flagID"=>"4", "@quantity"=>"-2", "@timeEfficiency"=>"0", "@materialEfficiency"=>"10", "@runs"=>"300"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Blueprint.new(row.first)
        #
        expect(EveOnline::Blueprint).to receive(:new).with(row.first)
      end

      specify { expect { subject.blueprints }.not_to raise_error }
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
end
