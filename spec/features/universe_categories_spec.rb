# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item categories" do
  before { VCR.insert_cassette "esi/universe/categories" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseCategories.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.category_ids.size).to eq(43) }

  specify { expect(subject.category_ids.first).to eq(0) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(13) }
end
