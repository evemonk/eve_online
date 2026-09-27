# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get insurance prices" do
  before { VCR.insert_cassette "esi/insurance/prices" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.insurance.prices }

  specify { expect(subject.size).to eq(569) }

  specify { expect(subject.first.as_json).to eq(type_id: 34_475) }

  specify { expect(subject.first.levels.size).to eq(6) }

  specify { expect(subject.first.levels.first.as_json).to eq(cost: 0.0, name: "Basic", payout: 0.0) }
end
