require 'spec_helper'

describe EveOnline::ESI::CharacterPortrait do
  let(:options) { { character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/characters/%s/portrait/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#as_json' do
    let(:portrait) { described_class.new(options) }

    let(:small) { double }

    let(:medium) { double }

    let(:large) { double }

    let(:huge) { double }

    before { expect(portrait).to receive(:small).and_return(small) }

    before { expect(portrait).to receive(:medium).and_return(medium) }

    before { expect(portrait).to receive(:large).and_return(large) }

    before { expect(portrait).to receive(:huge).and_return(huge) }

    subject { portrait.as_json }

    its([:small]) { should eq(small) }

    its([:medium]) { should eq(medium) }

    its([:large]) { should eq(large) }

    its([:huge]) { should eq(huge) }
  end

  describe '#tiny' do
    specify { expect { subject.tiny }.to raise_error(NotImplementedError) }
  end

  describe '#small' do
    before do
      #
      # subject.response['px64x64']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('px64x64')
        end
      end
    end

    specify { expect { subject.small }.not_to raise_error }
  end

  describe '#medium' do
    before do
      #
      # subject.response['px128x128']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('px128x128')
        end
      end
    end

    specify { expect { subject.medium }.not_to raise_error }
  end

  describe '#large' do
    before do
      #
      # subject.response['px256x256']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('px256x256')
        end
      end
    end

    specify { expect { subject.large }.not_to raise_error }
  end

  describe '#huge' do
    before do
      #
      # subject.response['px512x512']
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('px512x512')
        end
      end
    end

    specify { expect { subject.huge }.not_to raise_error }
  end

  describe '#gigantic' do
    specify { expect { subject.gigantic }.to raise_error(NotImplementedError) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/characters/12345678/portrait/?datasource=tranquility')
    end
  end
end
