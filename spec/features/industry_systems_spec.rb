# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get industry systems" do
  before { VCR.insert_cassette "esi/industry/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.industry.systems }

  specify { expect(subject.size).to eq(5485) }

  specify { expect(subject.first.as_json).to eq(solar_system_id: 30_020_141) }

  specify { expect(subject.first.cost_indices.size).to eq(6) }

  specify { expect(subject.first.cost_indices.first.as_json).to eq(activity: "manufacturing", cost_index: 0.0014) }
end
