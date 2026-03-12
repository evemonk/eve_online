# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get types" do
  before { VCR.insert_cassette "esi/universe/types" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseTypes.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(36) }

  specify { expect(subject.universe_type_ids.size).to eq(1000) }

  specify { expect(subject.universe_type_ids.first).to eq(0) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(45) }
end
