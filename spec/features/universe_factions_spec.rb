# frozen_string_literal: true

require "spec_helper"

describe "Get factions" do
  before { VCR.insert_cassette "esi/universe/factions_new" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.factions }

  specify { expect(subject.size).to eq(27) }

  specify do
    expect(subject.first.as_json).to eq(corporation_id: 1_000_084,
      description: "The largest of the five main empires, the Amarr Empire is a sprawling patch-work of feudal-like provinces held together by the might of the emperor. Religion has always played a big part in Amarrian politics and the Amarrians believe they are the rightful masters of the world, souring their relations with their neighbours. Another source of ill-feelings on part of the other empires is the fact that the Amarrians embrace slavery.",
      id: 500_003,
      is_unique: true,
      militia_corporation_id: 1_000_179,
      name: "Amarr Empire",
      size_factor: 5.0,
      solar_system_id: 30_002_187,
      station_count: 1_032,
      station_system_count: 508)
  end

  specify { expect(subject.etag).to eq("W/\"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("a3501e17-04f2-4a8b-a5a6-6805c31c09ca") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(31) }
end
