# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseSystems do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v1/universe/systems/') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
      its(:_write_timeout) { should eq(60) }
    end

    its(:datasource) { should eq('tranquility') }
  end

  describe '#universe_system_ids' do
    let(:response) { double }

    before { expect(subject).to receive(:response).and_return(response) }

    specify { expect(subject.universe_system_ids).to eq(response) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#path' do
    specify do
      expect(subject.path).to eq('/v1/universe/systems/')
    end
  end

  describe '#query' do
    specify do
      expect(subject.query).to eq(datasource: 'tranquility')
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/systems/?datasource=tranquility')
    end
  end
end
