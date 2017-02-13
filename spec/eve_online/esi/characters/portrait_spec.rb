require 'spec_helper'

describe EveOnline::ESI::Characters::Portrait do
  let(:character_id) { 12_345_678 }

  subject { described_class.new(character_id) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/latest/characters/%s/portrait/?datasource=tranquility') }

  describe '#initialize' do
    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(character_id) }
  end

  describe '#as_json' do
  end

  describe '#tiny' do
    specify { expect { subject.tiny }.to raise_error(NotImplementedError) }
  end

  describe '#small' do
    before do
      #
      # subject.response.fetch('px64x64')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('px64x64')
        end
      end
    end

    specify { expect { subject.small }.not_to raise_error }
  end

  describe '#medium' do
    before do
      #
      # subject.response.fetch('px128x128')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('px128x128')
        end
      end
    end

    specify { expect { subject.medium }.not_to raise_error }
  end

  describe '#large' do
    before do
      #
      # subject.response.fetch('px256x256')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('px256x256')
        end
      end
    end

    specify { expect { subject.large }.not_to raise_error }
  end

  describe '#huge' do
    before do
      #
      # subject.response.fetch('px512x512')
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:fetch).with('px512x512')
        end
      end
    end

    specify { expect { subject.huge }.not_to raise_error }
  end

  describe '#gigantic' do
    specify { expect { subject.gigantic }.to raise_error(NotImplementedError) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq(described_class::API_ENDPOINT % character_id)
    end
  end
end
