# frozen_string_literal: true

require "spec_helper"

describe "Get character bookmark folders" do
  # TODO: update response json
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: "token123",
      page: 1,
    }
  end

  before { VCR.insert_cassette "esi/character_bookmark_folders/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterBookmarkFolders.new(options) }

  specify { expect(subject.scope).to eq("esi-bookmarks.read_character_bookmarks.v1") }

  specify { expect(subject.not_modified?).to eq(false) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.bookmark_folders.size).to eq(0) }

  # TODO: test real
  # specify do
  #   expect(subject.bookmark_folders.first.as_json).to eq('')
  # end
end
