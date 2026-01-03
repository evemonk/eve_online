# frozen_string_literal: true

require "spec_helper"

describe "Get character's public information" do
  let(:options) { {character_id: 1_337_512_245} }

  before { VCR.insert_cassette "esi/characters/1337512245_new" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.characters.retrieve(id: 1_337_512_245) }

  specify do
    expect(subject.as_json).to eq(
      corporation_id: 1_000_171,
      birthday: Time.utc(2010, 1, 15, 15, 26, 0),
      name: "Johnn Dillinger",
      gender: "male",
      race_id: 2,
      bloodline_id: 4,
      description: "",
      alliance_id: nil,
      security_status: 3.83155339,
      faction_id: nil,
      title: nil
    )
  end

  specify { expect(subject.etag).to eq('"e931aea926d95a88c929c938741bc7bd8c35920121e7837ad6852020"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("17930397-e721-446e-8be2-f4ee6b462479") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(53) }
end
