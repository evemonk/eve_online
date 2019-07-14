# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CorporationAllianceHistory do
  let(:options) { { corporation_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_PATH).to eq('/v2/corporations/%<corporation_id>s/alliancehistory/') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
      its(:_write_timeout) { should eq(60) }
    end

    its(:datasource) { should eq('tranquility') }

    its(:corporation_id) { should eq(12_345_678) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#roles' do
    specify { expect(subject.roles).to eq([]) }
  end

  describe '#path' do
    specify do
      expect(subject.path).to eq('/v2/corporations/12345678/alliancehistory/')
    end
  end

  describe '#query' do
    specify do
      expect(subject.query).to eq(datasource: 'tranquility')
    end
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/corporations/12345678/alliancehistory/?datasource=tranquility')
    end
  end
end
