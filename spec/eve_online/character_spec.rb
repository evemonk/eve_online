require 'spec_helper'

describe EveOnline::Character do
  describe '#initialize' do
    let(:options) { {} }

    subject { described_class.new(options) }

    specify { expect(subject.options).to eq(options) }
  end

  describe '#as_json' do
    let(:character) { described_class.new }

    before { expect(character).to receive(:character_id).and_return(90_729_314) }

    before { expect(character).to receive(:character_name).and_return('Green Black') }

    before { expect(character).to receive(:corporation_id).and_return(1_000_168) }

    before { expect(character).to receive(:corporation_name).and_return('Federal Navy Academy') }

    before { expect(character).to receive(:alliance_id).and_return(0) }

    before { expect(character).to receive(:alliance_name).and_return('') }

    before { expect(character).to receive(:faction_id).and_return(0) }

    before { expect(character).to receive(:faction_name).and_return('') }

    subject { character.as_json }

    its([:character_id]) { should eq(90_729_314) }

    its([:character_name]) { should eq('Green Black') }

    its([:corporation_id]) { should eq(1_000_168) }

    its([:corporation_name]) { should eq('Federal Navy Academy') }

    its([:alliance_id]) { should eq(0) }

    its([:alliance_name]) { should eq('') }

    its([:faction_id]) { should eq(0) }

    its([:faction_name]) { should eq('') }
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

  describe '#character_name' do
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

    specify { expect { subject.character_name }.not_to raise_error }
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
