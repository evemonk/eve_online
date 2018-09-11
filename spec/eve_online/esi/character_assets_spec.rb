# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterAssets do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v3/characters/%<character_id>s/assets/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq('token123') }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:datasource) { should eq('tranquility') }

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { token: 'token123', character_id: 12_345_678, page: 10 } }

      its(:page) { should eq(10) }
    end
  end

  describe '#assets' do
    let(:asset) { double }

    let(:response) do
      [
        {
          type_id: 2629,
          location_id: 60_008_674,
          location_type: 'station',
          item_id: 1_006_604_012_678,
          location_flag: 'Hangar',
          is_singleton: false,
          quantity: 16_156
        }
      ]
    end

    before do
      #
      # subject.response # => [{"type_id"=>2629, "location_id"=>60008674, "location_type"=>"station", "item_id"=>1006604012678, "location_flag"=>"Hangar", "is_singleton"=>false, "quantity"=>16156}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Asset.new(response.first) # => assets
      #
      expect(EveOnline::ESI::Models::Asset).to receive(:new).with(response.first).and_return(asset)
    end

    specify { expect(subject.assets).to eq([asset]) }

    specify { expect { subject.assets }.to change { subject.instance_variable_defined?(:@_memoized_assets) }.from(false).to(true) }
  end

  # TODO: remove duplication
  describe '#total_pages' do
    let(:resource) { double }

    let(:headers) { double }

    let(:pages) { double }

    before { expect(subject).to receive(:resource).and_return(resource) }

    before { expect(resource).to receive(:headers).and_return(headers) }

    before { expect(headers).to receive(:[]).with('x-pages').and_return(pages) }

    before { expect(pages).to receive(:to_i) }

    specify { expect { subject.total_pages }.not_to raise_error }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-assets.read_assets.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v3/characters/12345678/assets/?datasource=tranquility&page=1')
    end
  end
end
