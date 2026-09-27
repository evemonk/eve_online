# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item groups" do
  before { VCR.insert_cassette "esi/market/groups" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.groups }

  specify { expect(subject.market_group_ids.size).to eq(2114) }

  specify { expect(subject.market_group_ids.first(3)).to eq([2, 4, 5]) }
end
