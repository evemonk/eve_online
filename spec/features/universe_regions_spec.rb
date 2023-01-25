# frozen_string_literal: true

require "spec_helper"

describe "Get regions" do
  before { VCR.insert_cassette "esi/universe/regions" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseRegions.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.universe_region_ids.size).to eq(106) }

  specify { expect(subject.universe_region_ids.first).to eq(10_000_001) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(59) }
end
