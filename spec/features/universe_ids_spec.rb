# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Bulk names to IDs" do
  before { VCR.insert_cassette "esi/universe/ids" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.ids(names: ["Jita", "Tritanium", "The Forge"]) }

  specify { expect(subject.systems.first.as_json).to eq(id: 30_000_142, name: "Jita") }

  specify { expect(subject.inventory_types.first.as_json).to eq(id: 34, name: "Tritanium") }

  specify { expect(subject.regions.first.as_json).to eq(id: 10_000_002, name: "The Forge") }

  specify { expect(subject.agents.size).to eq(0) }

  specify { expect(subject.ratelimit_group).to eq(nil) }
end
