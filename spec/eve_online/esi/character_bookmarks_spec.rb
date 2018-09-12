# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterBookmarks do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/characters/%<character_id>s/bookmarks/?datasource=%<datasource>s&page=%<page>s') }

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

  describe '#bookmarks' do
    let(:bookmark) { double }

    let(:response) do
      [
        {
          bookmark_id: 4,
          created: '2012-07-09T22:38:31Z',
          label: 'Stargate',
          notes: 'This is a stargate',
          location_id: 30_003_430,
          creator_id: 2_112_625_428
        }
      ]
    end

    before do
      #
      # subject.response # => [{"bookmark_id"=>4, "created"=>"2012-07-09T22:38:31Z", "label"=>"Stargate", "notes"=>"This is a stargate", "location_id"=>30003430, "creator_id"=>2112625428}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Bookmark.new(response.first) # => bookmark
      #
      expect(EveOnline::ESI::Models::Bookmark).to receive(:new).with(response.first).and_return(bookmark)
    end

    specify { expect(subject.bookmarks).to eq([bookmark]) }

    specify { expect { subject.bookmarks }.to change { subject.instance_variable_defined?(:@_memoized_bookmarks) }.from(false).to(true) }
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
    specify { expect(subject.scope).to eq('esi-bookmarks.read_character_bookmarks.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v2/characters/12345678/bookmarks/?datasource=tranquility&page=1')
    end
  end
end
