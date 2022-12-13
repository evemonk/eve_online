# frozen_string_literal: true

require "spec_helper"

describe "Get ancestries" do
  before { VCR.insert_cassette "esi/universe/ancestries" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseAncestries.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.ancestries.size).to eq(42) }

  specify do
    expect(subject.ancestries.first.as_json).to eq(ancestry_id: 1,
      bloodline_id: 5,
      description: "Holders, the major landholding class in Amarr society, are generally conservative traditionalists. A few, however, have elected to break ranks with their hidebound and power-hungry peers, instead supporting the modernization of their society's religion and substantial economic reform. Their champion is Catiz Tash-Murkon, the Udorian Royal Heir.",
      icon_id: 1641,
      name: "Liberal Holders",
      short_description: "Progressive members of the upper class who have rejected their traditional ways.")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(7) }
end
