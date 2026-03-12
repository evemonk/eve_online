# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item category information" do
  before { VCR.insert_cassette "esi/universe/categories/6" }

  after { VCR.eject_cassette }

  let(:options) { {id: 6} }

  subject { EveOnline::ESI::UniverseCategory.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(category_id: 6,
      name: "Ship",
      published: true)
  end

  specify { expect(subject.group_ids.size).to eq(46) }

  specify { expect(subject.group_ids.first).to eq(25) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(48) }
end
