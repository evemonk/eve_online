# frozen_string_literal: true

require 'spec_helper'

describe 'Get character bookmarks' do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: 'token123',
      page: 1
    }
  end

  before { VCR.insert_cassette 'esi/character_bookmarks/1337512245' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterBookmarks.new(options) }

  specify { expect(subject.scope).to eq('esi-bookmarks.read_character_bookmarks.v1') }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.bookmarks.size).to eq(20) }

  specify do
    expect(subject.bookmarks.first.as_json).to eq(bookmark_id: 726_640_415,
                                                  coordinate_x: nil,
                                                  coordinate_y: nil,
                                                  coordinate_z: nil,
                                                  created: Time.new(2012, 7, 9, 22, 38, 31, '+00:00'),
                                                  creator_id: 1_337_512_245,
                                                  folder_id: nil,
                                                  item_id: 30_003_496,
                                                  item_type_id: 5,
                                                  label: "Nakri* (Solar System*)\t",
                                                  location_id: 20_000_510,
                                                  notes: '')
  end
end
