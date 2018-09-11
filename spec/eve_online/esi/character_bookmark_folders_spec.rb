# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::CharacterBookmarkFolders do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v2/characters/%<character_id>s/bookmarks/folders/?datasource=%<datasource>s&page=%<page>s') }

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

  describe '#bookmark_folders' do
    let(:bookmark_folder) { double }

    let(:response) do
      [
        {
          folder_id: 5,
          name: 'Icecream'
        }
      ]
    end

    before do
      #
      # subject.response # => [{"folder_id"=>5, "name"=>"Icecream"}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::BookmarkFolder.new(response.first) # => bookmark_folder
      #
      expect(EveOnline::ESI::Models::BookmarkFolder).to receive(:new).with(response.first).and_return(bookmark_folder)
    end

    specify { expect(subject.bookmark_folders).to eq([bookmark_folder]) }

    specify { expect { subject.bookmark_folders }.to change { subject.instance_variable_defined?(:@_memoized_bookmark_folders) }.from(false).to(true) }
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
      expect(subject.url).to eq('https://esi.evetech.net/v2/characters/12345678/bookmarks/folders/?datasource=tranquility&page=1')
    end
  end
end
