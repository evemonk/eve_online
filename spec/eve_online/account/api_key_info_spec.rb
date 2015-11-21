require 'spec_helper'

describe EveOnline::Account::ApiKeyInfo do
  let(:key_id) { '123' }

  let(:v_code) { 'abc' }

  subject { described_class.new(key_id, v_code) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://api.eveonline.com/account/APIKeyInfo.xml.aspx') }

  describe '#character_id' do
    before do
      #
      # subject.row.fetch('@characterID').to_i
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@characterID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.character_id }.not_to raise_error }
  end

  describe '#character_name' do
    before do
      #
      # subject.row.fetch('@characterName')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@characterName')
        end
      end
    end

    specify { expect { subject.character_name }.not_to raise_error }
  end

  describe '#corporation_id' do
    before do
      #
      # subject.row.fetch('@corporationID').to_i
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@corporationID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.corporation_id }.not_to raise_error }
  end

  describe '#corporation_name' do
    before do
      #
      # subject.row.fetch('@corporationName')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@corporationName')
        end
      end
    end

    specify { expect { subject.corporation_name }.not_to raise_error }
  end

  describe '#alliance_id' do
    before do
      #
      # subject.row.fetch('@allianceID').to_i
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@allianceID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.alliance_id }.not_to raise_error }
  end

  describe '#alliance_name' do
    before do
      #
      # subject.row.fetch('@allianceName')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@allianceName')
        end
      end
    end

    specify { expect { subject.alliance_name }.not_to raise_error }
  end

  describe '#faction_id' do
    before do
      #
      # subject.row.fetch('@factionID').to_i
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@factionID') do
            double.tap do |b|
              expect(b).to receive(:to_i)
            end
          end
        end
      end
    end

    specify { expect { subject.faction_id }.not_to raise_error }
  end

  describe '#faction_name' do
    before do
      #
      # subject.row.fetch('@factionName')
      #
      expect(subject).to receive(:row) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@factionName')
        end
      end
    end

    specify { expect { subject.faction_name }.not_to raise_error }
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
      # subject.key.fetch('@accessMask')
      #
      expect(subject).to receive(:key) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@accessMask')
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

  describe '#result' do
    before do
      #
      # subject.eveapi.fetch('result')
      #
      expect(subject).to receive(:eveapi) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('result')
        end
      end
    end

    specify { expect { subject.result }.not_to raise_error }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq("#{ described_class::API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }")
    end
  end
end
