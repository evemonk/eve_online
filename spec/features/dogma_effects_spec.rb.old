# frozen_string_literal: true

require "spec_helper"

describe "Get effects" do
  before { VCR.insert_cassette "esi/dogma/effects" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::DogmaEffects.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.effect_ids.size).to eq(4166) }

  specify { expect(subject.effect_ids.first).to eq(4) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(19) }
end
