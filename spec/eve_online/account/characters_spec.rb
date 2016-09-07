require 'spec_helper'

describe EveOnline::Account::Characters do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/Characters.xml.aspx') }

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
  end

  describe '#characters' do
    context 'row is Hash' do
      let(:character) { double }

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
        # EveOnline::Character.new(row) # => character
        #
        expect(EveOnline::Character).to receive(:new).with(row).and_return(character)
      end

      specify { expect(subject.characters).to eq([character]) }

      specify { expect { subject.characters }.to change { subject.instance_variable_defined?(:@_memoized_characters) }.from(false).to(true) }
    end

    context 'row is Array' do
      let(:character) { double }

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
        # EveOnline::Character.new(row.first) # => character
        #
        expect(EveOnline::Character).to receive(:new).with(row.first).and_return(character)
      end

      specify { expect(subject.characters).to eq([character]) }

      specify { expect { subject.characters }.to change { subject.instance_variable_defined?(:@_memoized_characters) }.from(false).to(true) }
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

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
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
