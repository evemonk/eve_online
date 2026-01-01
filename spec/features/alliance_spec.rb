# frozen_string_literal: true

require "spec_helper"

describe "Get alliance information" do
  before { VCR.insert_cassette "esi/alliances/99008595" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.retrieve(id: 99_008_595) }

  specify do
    expect(subject.as_json).to eq(name: "The Dead Parrots",
      creator_id: 95_078_959,
      creator_corporation_id: 98_573_850,
      ticker: "TDP",
      date_founded: "2018-09-11T19:55:16Z",
      executor_corporation_id: 98_565_696,
      faction_id: nil)
  end

  specify { expect(subject.etag).to eq('"5eedb79d062aad2bed4e103e149ebf728be9f2d69b63ecf186f45c1d"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("ab376bd9-2f4f-4a7f-809b-7de40de4ef26") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(20) }
end
