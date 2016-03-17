require 'spec_helper'

describe EveOnline::Account::Characters do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a EveOnline::Base }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/Characters.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }
  end

  describe '#characters' do
    context 'row is Hash' do
      let(:row) do
        {
          '@name' => 'Green Black',
          '@characterID' => '90729314',
          '@corporationName' => 'Federal Navy Academy',
          '@corporationID' => '1000168',
          '@allianceID' => '0',
          '@allianceName' => '',
          '@factionID' => '0',
          '@factionName' => ''
        }
      end

      before do
        #
        # subject.row # => {"@name"=>"Green Black", "@characterID"=>"90729314", "@corporationName"=>"Federal Navy Academy", "@corporationID"=>"1000168", "@allianceID"=>"0", "@allianceName"=>"", "@factionID"=>"0", "@factionName"=>""}
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Character.new(row)
        #
        expect(EveOnline::Character).to receive(:new).with(row)
      end

      specify { expect { subject.characters }.not_to raise_error }
    end

    context 'row is Array' do
      let(:row) do
        [
          {
            '@name' => 'Green Black',
            '@characterID' => '90729314',
            '@corporationName' => 'Federal Navy Academy',
            '@corporationID' => '1000168',
            '@allianceID' => '0',
            '@allianceName' => '',
            '@factionID' => '0',
            '@factionName' => ''
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@name"=>"Green Black", "@characterID"=>"90729314", "@corporationName"=>"Federal Navy Academy", "@corporationID"=>"1000168", "@allianceID"=>"0", "@allianceName"=>"", "@factionID"=>"0", "@factionName"=>""}]
        #
        expect(subject).to receive(:row).and_return(row).twice
      end

      before do
        #
        # EveOnline::Character.new(row.first)
        #
        expect(EveOnline::Character).to receive(:new).with(row.first)
      end

      specify { expect { subject.characters }.not_to raise_error }
    end

    context 'row is invalid' do
      before do
        #
        # subject.row # => 'invalid'
        #
        expect(subject).to receive(:row).and_return('invalid')
      end

      specify { expect { subject.characters }.to raise_error(ArgumentError) }
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
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
