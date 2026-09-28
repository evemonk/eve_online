# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List alliance's corporations" do
  before { VCR.insert_cassette "esi/alliance_corporations/99008595" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.corporations(id: 99_008_595) }

  specify { expect(subject.corporation_ids.size).to eq(0) }

  specify { expect(subject.corporation_ids.first).to eq(nil) }

  specify { expect(subject.etag).to eq('"ed2e5773d709f4a0654d954884b08db4e152aeb8a70cb70b54e01bc4"') }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("b3b97b25-d750-4de9-86c1-409ff57f0d4c") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(48) }
end
