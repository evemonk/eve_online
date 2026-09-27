# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item group information" do
  before { VCR.insert_cassette "esi/market/groups/5" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.group(id: 5) }

  specify do
    expect(subject.as_json).to eq(description: "Small, fast vessels suited to a variety of purposes.",
      market_group_id: 5,
      name: "Standard Frigates",
      parent_group_id: 1361,
      types: [])
  end
end
