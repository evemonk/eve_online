# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get names and categories for a set of IDs" do
  before { VCR.insert_cassette "esi/universe/names" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.names(ids: [30_000_142, 34, 10_000_002]) }

  specify { expect(subject.size).to eq(3) }

  specify { expect(subject.first.as_json).to eq(category: "solar_system", id: 30_000_142, name: "Jita") }

  specify { expect(subject.last.as_json).to eq(category: "region", id: 10_000_002, name: "The Forge") }
end
