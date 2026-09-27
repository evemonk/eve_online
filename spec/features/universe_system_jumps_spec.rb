# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get system jumps" do
  before { VCR.insert_cassette "esi/universe/system_jumps" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.system_jumps }

  specify { expect(subject.size).to eq(4930) }

  specify { expect(subject.first.as_json).to eq(ship_jumps: 90, system_id: 30_003_374) }
end
