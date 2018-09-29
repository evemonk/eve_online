# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterKillmailsRecent do
  let(:options) { { character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/characters/%<character_id>s/killmails/recent/?datasource=%<datasource>s&page=%<page>s') }

  describe '#initialize' do
    context 'without options' do
      its(:token) { should eq(nil) }

      its(:parser) { should eq(JSON) }

      its(:_read_timeout) { should eq(60) }

      its(:_open_timeout) { should eq(60) }

      its(:datasource) { should eq('tranquility') }

      its(:character_id) { should eq(12_345_678) }

      its(:page) { should eq(1) }
    end

    context 'with options' do
      let(:options) { { character_id: 12_345_678, page: 10 } }

      its(:page) { should eq(10) }
    end
  end

  describe '#killmails' do
    let(:killmail) { instance_double(EveOnline::ESI::Models::KillmailShort) }

    let(:response) do
      [
        {
          'killmail_hash' => '07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5',
          'killmail_id' => 72_410_059
        }
      ]
    end

    before do
      #
      # subject.response # => [{"killmail_hash"=>716338097, "killmail_id"=>72410059}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::KillmailShort.new(response.first) # => killmail
      #
      expect(EveOnline::ESI::Models::KillmailShort).to receive(:new).with(response.first).and_return(killmail)
    end

    specify { expect(subject.killmails).to eq([killmail]) }

    specify { expect { subject.killmails }.to change { subject.instance_variable_defined?(:@_memoized_killmails) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-killmails.read_killmails.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/characters/12345678/killmails/recent/?datasource=tranquility&page=1')
    end
  end
end
