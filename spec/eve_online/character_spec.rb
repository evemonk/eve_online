require 'spec_helper'

describe EveOnline::Character do
  let(:options) do
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

  describe '#initialize' do
    subject { described_class.new(options) }

    specify { expect(subject.options).to eq(options) }
  end

  describe '#as_json' do
    subject { described_class.new(options).as_json }

    its([:name]) { should eq('Green Black') }

    its([:character_id]) { should eq(90_729_314) }

    its([:corporation_name]) { should eq('Federal Navy Academy') }

    its([:corporation_id]) { should eq(1_000_168) }

    its([:alliance_name]) { should eq('') }

    its([:alliance_id]) { should eq(0) }

    its([:faction_name]) { should eq('') }

    its([:faction_id]) { should eq(0) }
  end

  describe '#name' do
    before do
      #
      # subject.options.fetch('@name')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@name')
        end
      end
    end

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#character_id' do
    before do
      #
      # subject.options.fetch('@characterID').to_i
      #
      expect(subject).to receive(:options) do
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

  describe '#corporation_name' do
    before do
      #
      # subject.options.fetch('@corporationName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@corporationName')
        end
      end
    end

    specify { expect { subject.corporation_name }.not_to raise_error }
  end

  describe '#corporation_id' do
    before do
      #
      # subject.options.fetch('@corporationID').to_i
      #
      expect(subject).to receive(:options) do
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

  describe '#alliance_id' do
    before do
      #
      # subject.options.fetch('@allianceID').to_i
      #
      expect(subject).to receive(:options) do
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
      # subject.options.fetch('@allianceName')
      #
      expect(subject).to receive(:options) do
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
      # subject.options.fetch('@factionID').to_i
      #
      expect(subject).to receive(:options) do
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
      # subject.options.fetch('@factionName')
      #
      expect(subject).to receive(:options) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('@factionName')
        end
      end
    end

    specify { expect { subject.faction_name }.not_to raise_error }
  end
end
