# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::AllianceCorporations do
  let(:options) { { alliance_id: 99_005_443 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/alliances/%<alliance_id>s/corporations/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }

    its(:alliance_id) { should eq(99_005_443) }
  end

  describe '#corporations' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.corporations).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/alliances/99005443/corporations/?datasource=tranquility')
    end
  end
end
