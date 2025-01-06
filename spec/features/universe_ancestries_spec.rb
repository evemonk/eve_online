# frozen_string_literal: true

require "spec_helper"

describe "Get ancestries" do
  before { VCR.insert_cassette "esi/universe/ancestries" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseAncestries.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.ancestries.size).to eq(43) }

  specify do
    expect(subject.ancestries.first.as_json).to eq(id: 13,
      bloodline_id: 7,
      description: "The Gallente prize political activism more so than other Empires. Many devote their efforts towards one or more causes that suit their ambitions. Activists understand that things will never change for the better unless someone has the courage to fight the good fight.",
      icon_id: 1_653,
      name: "Activists",
      short_description: "Making the universe a better place, one fight at a time.")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end
