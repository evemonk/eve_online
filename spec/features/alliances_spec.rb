# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List all alliances" do
  before { VCR.insert_cassette "esi/alliances/list" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.list }

  specify { expect(subject.alliance_ids.size).to eq(3647) }

  specify { expect(subject.alliance_ids.first).to eq(99_000_006) }

  specify { expect(subject.alliance_ids.last).to eq(2_049_763_943) }

  specify { expect(subject.etag).to eq('"bc5569713879ddef6831619d80fa352343b5d34c090a997535cb45a1"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("d706d7eb-037c-46a2-b53a-2ae0bba419c2") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(47) }
end
