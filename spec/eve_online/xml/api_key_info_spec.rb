require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::XML::ApiKeyInfo do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

  specify { expect(described_class).to be_a(Forwardable) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/APIKeyInfo.xml.aspx') }

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

  describe '#model' do
    let(:key) { double }

    before { expect(subject).to receive(:key).and_return(key) }

    before do
      #
      # EveOnline::XML::Models::ApiKeyInfo.new(key)
      #
      expect(EveOnline::XML::Models::ApiKeyInfo).to receive(:new).with(key)
    end

    specify { expect { subject.model }.not_to raise_error }

    specify { expect { subject.model }.to change { subject.instance_variable_defined?(:@_memoized_model) }.from(false).to(true) }
  end

  describe '#as_json' do
    before do
      #
      # subject.model.as_json
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:as_json)
        end
      end
    end

    specify { expect { subject.as_json }.not_to raise_error }
  end

  describe '#expires' do
    before do
      #
      # subject.model.expires
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:expires)
        end
      end
    end

    specify { expect { subject.expires }.not_to raise_error }
  end

  describe '#api_key_type' do
    before do
      #
      # subject.model.api_key_type
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:api_key_type)
        end
      end
    end

    specify { expect { subject.api_key_type }.not_to raise_error }
  end

  describe '#access_mask' do
    before do
      #
      # subject.model.access_mask
      #
      expect(subject).to receive(:model) do
        double.tap do |a|
          expect(a).to receive(:access_mask)
        end
      end
    end

    specify { expect { subject.access_mask }.not_to raise_error }
  end

  describe '#characters' do
    context 'row is Hash' do
      let(:character) { double }

      let(:row) do
        {
          '@characterID' => '90729314',
          '@characterName' => 'Green Black',
          '@corporationID' => '1000168',
          '@corporationName' => 'Federal Navy Academy',
          '@allianceID' => '0',
          '@allianceName' => '',
          '@factionID' => '0',
          '@factionName' => ''
        }
      end

      before do
        #
        # subject.row # => {"@characterID"=>"90729314", "@characterName"=>"Green Black", "@corporationID"=>"1000168", "@corporationName"=>"Federal Navy Academy", "@allianceID"=>"0", "@allianceName"=>"", "@factionID"=>"0", "@factionName"=>""}
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
            '@characterID' => '90729314',
            '@characterName' => 'Green Black',
            '@corporationID' => '1000168',
            '@corporationName' => 'Federal Navy Academy',
            '@allianceID' => '0',
            '@allianceName' => '',
            '@factionID' => '0',
            '@factionName' => ''
          }
        ]
      end

      before do
        #
        # subject.row # => [{"@characterID"=>"90729314", "@characterName"=>"Green Black", "@corporationID"=>"1000168", "@corporationName"=>"Federal Navy Academy", "@allianceID"=>"0", "@allianceName"=>"", "@factionID"=>"0", "@factionName"=>""}]
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

  describe '#key' do
    before do
      #
      # subject.result.fetch('key')
      #
      expect(subject).to receive(:result) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('key')
        end
      end
    end

    specify { expect { subject.send(:key) }.not_to raise_error }
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

  describe '#rowset' do
    before do
      #
      # subject.key.fetch('rowset')
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.send(:rowset) }.not_to raise_error }

    specify { expect { subject.send(:rowset) }.to change { subject.instance_variable_defined?(:@_memoized_rowset) }.from(false).to(true) }
  end
end
