# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get market prices" do
  before { VCR.insert_cassette "esi/market/prices" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.prices }

  specify { expect(subject.size).to eq(15_787) }

  specify do
    expect(subject.first.as_json).to eq(adjusted_price: 30.049220623663558,
      average_price: 27.81,
      type_id: 18)
  end
end
