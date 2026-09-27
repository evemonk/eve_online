# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get corporation icon" do
  before { VCR.insert_cassette "esi/corporations/98468592/icons" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.corporations.icons(id: 98_468_592) }

  specify do
    expect(subject.as_json).to eq(icon_large: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=256",
      icon_medium: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=128",
      icon_small: "https://images.evetech.net/corporations/98468592/logo?tenant=tranquility&size=64")
  end
end
