# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get SKINR information" do
  before { VCR.insert_cassette "esi/cosmetics/skinr/668aef3eef646471b6eed18ddcf191d78b51c2434d53c4bce9725c00ff7cfb60" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject do
    client.cosmetics.skinr(id: "668aef3eef646471b6eed18ddcf191d78b51c2434d53c4bce9725c00ff7cfb60")
  end

  specify do
    expect(subject.as_json).to eq(creator_id: 91_095_887,
      id: "668aef3eef646471b6eed18ddcf191d78b51c2434d53c4bce9725c00ff7cfb60",
      line: "\"Work hard, dream big.\"",
      name: "Pay Dirt",
      ship_type_id: 17_478)
  end

  specify { expect(subject.tier.as_json).to eq(level: 9) }

  specify { expect(subject.layout.as_json).to eq(pattern_blend_mode: "normal") }

  specify { expect(subject.layout.slots.size).to eq(8) }

  specify { expect(subject.layout.slots.first.as_json).to eq(id: 1) }

  specify { expect(subject.layout.slots.first.configuration).to eq("nanocoating" => {"id" => 1876}) }
end
