# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List all alliances" do
  before { VCR.insert_cassette "esi/alliances/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.list }

  specify { expect(subject.alliance_ids.size).to eq(3533) }

  specify { expect(subject.alliance_ids.first).to eq(99_000_006) }

  specify { expect(subject.etag).to eq('"d75094454a392e951b98262986a2ae022230d15d6ba0625d112bf03c"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("5bf9cfa4-0708-4359-82d3-206eccb5f661") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(53) }
end
