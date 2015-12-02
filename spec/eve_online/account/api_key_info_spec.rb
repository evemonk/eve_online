require 'spec_helper'

describe EveOnline::Account::ApiKeyInfo do
  let(:key_id) { 123 }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/APIKeyInfo.xml.aspx') }

  describe '#initialize' do
    its(:key_id) { should eq(key_id) }

    its(:v_code) { should eq(v_code) }
  end

  describe '#characters' do
    context 'row is Hash' do
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
        # EveOnline::Character.new(row)
        #
        expect(EveOnline::Character).to receive(:new).with(row)
      end

      specify { expect { subject.characters }.not_to raise_error }
    end

    context 'row is Array' do
      let(:row) do
        [{
           '@characterID' => '90729314',
           '@characterName' => 'Green Black',
           '@corporationID' => '1000168',
           '@corporationName' => 'Federal Navy Academy',
           '@allianceID' => '0',
           '@allianceName' => '',
           '@factionID' => '0',
           '@factionName' => ''
         }]
      end

      before do
        #
        # subject.row # => [{"@characterID"=>"90729314", "@characterName"=>"Green Black", "@corporationID"=>"1000168", "@corporationName"=>"Federal Navy Academy", "@allianceID"=>"0", "@allianceName"=>"", "@factionID"=>"0", "@factionName"=>""}]
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
      # subject.key.fetch('rowset')
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('rowset')
        end
      end
    end

    specify { expect { subject.rowset }.not_to raise_error }
  end

  describe '#expires' do
    before do
      #
      # subject.key.fetch('@expires')
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@expires')
        end
      end
    end

    specify { expect { subject.expires }.not_to raise_error }
  end

  describe '#type' do
    before do
      #
      # subject.key.fetch('@type')
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@type')
        end
      end
    end

    specify { expect { subject.type }.not_to raise_error }
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

    specify { expect { subject.key }.not_to raise_error }
  end

  describe '#version' do
    before do
      #
      # subject.eveapi.fetch('@version').to_i
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@version') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.version }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
