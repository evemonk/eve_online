# frozen_string_literal: true

require "spec_helper"

describe "Get character races" do
  before { VCR.insert_cassette "esi/universe/races" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.races }

  specify { expect(subject.size).to eq(6) }

  specify do
    expect(subject.first.as_json).to eq(faction_id: 500_001,
      description: "Founded on the tenets of patriotism and hard work that carried its ancestors through hardships on an inhospitable homeworld, the Caldari State is today a corporate dictatorship, led by rulers who are determined to see it return to the meritocratic ideals of old. Ruthless and efficient in the boardroom as well as on the battlefield, the Caldari are living emblems of strength, persistence, and dignity.",
      name: "Caldari",
      id: 1)
  end

  specify { expect(subject.etag).to eq("W/\"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("4cd7fc66-7920-414a-a2fe-a503582ad0d8") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(44) }
end
