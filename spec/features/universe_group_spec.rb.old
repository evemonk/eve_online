# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item group information" do
  before { VCR.insert_cassette "esi/universe/groups/450" }

  after { VCR.eject_cassette }

  let(:options) { {id: 450, language: "en-us"} }

  subject { EveOnline::ESI::UniverseGroup.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(category_id: 25,
      group_id: 450,
      name: "Arkonor",
      published: true)
  end

  specify { expect(subject.type_ids.size).to eq(10) }

  specify { expect(subject.type_ids.first).to eq(22) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(26) }
end
