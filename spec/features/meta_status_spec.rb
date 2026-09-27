# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get ESI meta status" do
  before { VCR.insert_cassette "esi/meta/status" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.meta.status }

  specify { expect(subject.as_json[:routes]).to be_an(Array) }

  specify { expect(subject.as_json[:routes].first).to eq("method" => "GET", "path" => "/alliances", "status" => "OK") }

  specify { expect(subject.ratelimit_group).to eq("meta") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }
end
