require 'spec_helper'

describe EveOnline::Characters::AssetList do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  let(:flat) { 0 }

  subject { described_class.new(key_id, v_code, character_id, flat) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/AssetList.xml.aspx') }

  describe '#initialize' do
    context 'without params' do
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

      its(:flat) { should eq(flat) }
    end

    context 'with params' do
      subject { described_class.new(key_id, v_code, character_id) }

      its(:flat) { should eq(1) }
    end
  end

  describe '#assets' do
    context 'row is Hash' do
      let(:item) { double }

      let(:row) do
        {
          '@itemID' => '408887580',
          '@locationID' => '60000634',
          '@typeID' => '588',
          '@quantity' => '1',
          '@flag' => '4',
          '@singleton' => '1',
          '@rawQuantity' => '-1'
        }
      end

      before do
        #
        # subject.row # => {"@itemID"=>"408887580", "@locationID"=>"60000634", "@typeID"=>"588", "@quantity"=>"1", "@flag"=>"4", "@singleton"=>"1", "@rawQuantity"=>"-1"}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Item.new(row) # => item
        #
        expect(EveOnline::Item).to receive(:new).with(row).and_return(item)
      end

      specify { expect(subject.assets).to eq([item]) }
    end

    context 'row is Array' do
      let(:item) { double }

      let(:row) do
        [
          {
            '@itemID' => '408887580',
            '@locationID' => '60000634',
            '@typeID' => '588',
            '@quantity' => '1',
            '@flag' => '4',
            '@singleton' => '1',
            '@rawQuantity' => '-1'
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@itemID"=>"408887580", "@locationID"=>"60000634", "@typeID"=>"588", "@quantity"=>"1", "@flag"=>"4", "@singleton"=>"1", "@rawQuantity"=>"-1"}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Item.new(row.first) # => item
        #
        expect(EveOnline::Item).to receive(:new).with(row.first).and_return(item)
      end

      specify { expect(subject.assets).to eq([item]) }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.assets }.to raise_error(ArgumentError) }
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }")
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
  end
end
