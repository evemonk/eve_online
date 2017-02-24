require 'spec_helper'

# rubocop:disable Metrics/BlockLength
describe EveOnline::Account::ApiKeyInfo do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(subject).to be_a(EveOnline::BaseXML) }

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

  describe '#as_json' do
    let(:api_key_info) { described_class.new(key_id, v_code) }

    let(:expires) { double }

    let(:current_time) { double }

    let(:cached_until) { double }

    before { expect(api_key_info).to receive(:expires).and_return(expires) }

    before { expect(api_key_info).to receive(:api_key_type).and_return(:character) }

    before { expect(api_key_info).to receive(:access_mask).and_return(1_073_741_823) }

    before { expect(api_key_info).to receive(:current_time).and_return(current_time) }

    before { expect(api_key_info).to receive(:cached_until).and_return(cached_until) }

    subject { api_key_info.as_json }

    its([:expires]) { should eq(expires) }

    its([:api_key_type]) { should eq(:character) }

    its([:access_mask]) { should eq(1_073_741_823) }

    its([:current_time]) { should eq(current_time) }

    its([:cached_until]) { should eq(cached_until) }
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

  describe '#expires' do
    let(:expires) { double }

    before do
      #
      # subject.key.fetch('@expires') => expires
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@expires').and_return(expires)
        end
      end
    end

    before do
      #
      # subject.parse_datetime_with_timezone(expires)
      #
      expect(subject).to receive(:parse_datetime_with_timezone).with(expires)
    end

    specify { expect { subject.expires }.not_to raise_error }
  end

  describe '#api_key_type' do
    let(:type) { double }

    before do
      #
      # subject.key.fetch('@type') => type
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@type').and_return(type)
        end
      end
    end

    before do
      expect(EveOnline::AccountTypeObject).to receive(:new).with(type) do
        double.tap do |a|
          expect(a).to receive(:value)
        end
      end
    end

    specify { expect { subject.api_key_type }.not_to raise_error }
  end

  describe '#access_mask' do
    before do
      #
      # subject.key.fetch('@accessMask').to_i
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accessMask') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.access_mask }.not_to raise_error }
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
