# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseTypes do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/universe/types/?datasource=%<datasource>s&page=1') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#universe_types_ids' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.universe_types_ids).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/types/?datasource=tranquility&page=1')
    end
  end
end
