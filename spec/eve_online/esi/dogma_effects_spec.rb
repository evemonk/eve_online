# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::DogmaEffects do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/dogma/effects/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#effects_ids' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.effects_ids).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/dogma/effects/?datasource=tranquility')
    end
  end
end
