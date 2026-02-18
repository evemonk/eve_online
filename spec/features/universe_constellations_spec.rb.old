# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get constellations" do
  before { VCR.insert_cassette "esi/universe/constellations" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseConstellations.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.constellation_ids.size).to eq(1146) }

  specify { expect(subject.constellation_ids.first).to eq(20_000_001) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(34) }
end
