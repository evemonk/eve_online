# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List kills for a war" do
  before { VCR.insert_cassette "esi/wars/744979/killmails" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.wars.killmails(war_id: 744_979) }

  specify { expect(subject.size).to eq(3) }

  specify do
    expect(subject.first.as_json).to eq(killmail_hash: "aa7ef390212e3fd470924b0db8532c15710749e2",
      killmail_id: 121_385_936)
  end

  specify { expect(subject.ratelimit_group).to eq("killmail") }

  specify { expect(subject.total_pages).to eq(1) }
end
