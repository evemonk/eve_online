# frozen_string_literal: true

require "spec_helper"

describe "Get route between two systems" do
  before { VCR.insert_cassette "esi/routes" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  let(:jita_system_id) { 30_000_142 }

  let(:amarr_system_id) { 30_002_187 }

  subject { client.routes.route(destination_system_id: amarr_system_id, origin_system_id: jita_system_id) }

  specify { expect(subject).to eq([]) }
end
