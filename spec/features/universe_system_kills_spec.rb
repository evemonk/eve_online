# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get system kills" do
  before { VCR.insert_cassette "esi/universe/system_kills" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.system_kills }

  specify { expect(subject.size).to eq(2852) }

  specify { expect(subject.first.as_json).to eq(npc_kills: 55, pod_kills: 0, ship_kills: 0, system_id: 30_001_342) }

  specify { expect(subject.etag).to eq("\"8eae3fadb3fe6347f48eece4cb8e1f630f4094b8247a45fe2076479c\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("cf11fc53-89e8-4f72-9526-d957d55dc117") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(3) }
end
