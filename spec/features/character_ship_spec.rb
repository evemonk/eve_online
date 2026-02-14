# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get current ship" do
  before { VCR.insert_cassette "esi/character_ship/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.wallet.character(id: 1_337_512_245) }
end
