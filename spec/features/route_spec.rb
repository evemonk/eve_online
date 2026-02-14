# frozen_string_literal: true

require "spec_helper"

describe "Get route between two systems" do
  before { VCR.insert_cassette "esi/routes" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.routes.route(destination_system_id: 30_002_187, origin_system_id: 30000142) }

  specify { expect(subject).to eq([]) }
end
