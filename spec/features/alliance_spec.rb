# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get alliance information" do
  before { VCR.insert_cassette "esi/alliances/99008595" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.retrieve(id: 99_008_595) }

  specify do
    expect(subject.as_json).to eq(
      name: "The Dead Parrots",
      creator_id: 95_078_959,
      creator_corporation_id: 98_573_850,
      ticker: "TDP",
      date_founded: Time.utc(2018, 9, 11, 19, 55, 16),
      executor_corporation_id: 98_565_696,
      faction_id: nil
    )
  end

  specify { expect(subject.etag).to eq('W/"59a0ed33022941d1509d78106e28e5624a950ee91cde4dea41008025e30a550e"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(55) }
end
