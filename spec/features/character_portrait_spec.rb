# frozen_string_literal: true

require "spec_helper"

describe "Get character portraits" do
  let(:options) do
    {
      character_id: 1_337_512_245
    }
  end

  before { VCR.insert_cassette "esi/character_portraits/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterPortrait.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(huge: "https://images.evetech.net/Character/1337512245_512.jpg",
      large: "https://images.evetech.net/Character/1337512245_256.jpg",
      medium: "https://images.evetech.net/Character/1337512245_128.jpg",
      small: "https://images.evetech.net/Character/1337512245_64.jpg")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(14) }
end
