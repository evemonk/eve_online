# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterAssetsLocations do
  let(:options) { { character_id: 12_345_678, item_ids: [1_001_215_602_246] } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/characters/%<character_id>s/assets/locations/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:character_id) { should eq(12_345_678) }

    its(:item_ids) { should eq([1_001_215_602_246]) }
  end

  describe '#http_method' do
    specify { expect(subject.http_method).to eq('Post') }
  end

  # describe '#payload' do
  # end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-assets.read_assets.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/characters/12345678/assets/locations/?datasource=tranquility')
    end
  end
end
