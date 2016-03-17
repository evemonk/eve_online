require 'spec_helper'

describe EveOnline::Characters::AssetList do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  let(:character_id) { 12_345_678 }

  let(:flat) { 0 }

  subject { described_class.new(key_id, v_code, character_id, flat) }

  specify { should be_a EveOnline::Base }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/char/AssetList.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }

    its(:character_id) { should eq(character_id) }

    its(:flat) { should eq(flat) }
  end

  describe '#assets' do
    context 'row is Hash' do
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
        # EveOnline::Item.new(row)
        #
        expect(EveOnline::Item).to receive(:new).with(row)
      end

      specify { expect { subject.assets }.not_to raise_error }
    end

    context 'row is Array' do
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
        # EveOnline::Item.new(row.first)
        #
        expect(EveOnline::Item).to receive(:new).with(row.first)
      end

      specify { expect { subject.assets }.not_to raise_error }
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

    specify { expect { subject.row }.not_to raise_error }
  end

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

    specify { expect { subject.rowset }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&flat=#{ flat }")
    end
  end
end
