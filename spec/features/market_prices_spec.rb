# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get market prices" do
  before { VCR.insert_cassette "esi/market/prices" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.market.prices }

  specify { expect(subject.size).to eq(15_787) }

  specify do
    expect(subject.first.as_json).to eq(adjusted_price: 30.049220623663558,
      average_price: 27.81,
      type_id: 18)
  end

  specify { expect(subject.etag).to eq("\"6a8776399194cd9f179c76cdaca96edea3552e9abc81149636959b2e\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("79586b62-725e-424e-949b-21e3855d0607") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end
