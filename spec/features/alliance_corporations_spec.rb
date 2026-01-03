# frozen_string_literal: true

require "spec_helper"

describe "List alliance's corporations" do
  before { VCR.insert_cassette "esi/alliance_corporations/99008595_new" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.corporations(id: 99_008_595) }

  specify { expect(subject.corporation_ids.size).to eq(5) }

  specify { expect(subject.corporation_ids.first).to eq(98_565_696) }

  specify { expect(subject.etag).to eq('"c4e774537fe210864f69ec66cd3c2726d19f2668a1219090965eebed"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("d5b50365-6306-4420-a137-29a31a982277") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(51) }
end
