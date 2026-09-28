# frozen_string_literal: true

require "spec_helper"

RSpec.describe "List alliance's corporations" do
  before { VCR.insert_cassette "esi/alliance_corporations/1354830081" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.alliances.corporations(id: 1_354_830_081) }

  specify { expect(subject.corporation_ids.size).to eq(805) }

  specify { expect(subject.corporation_ids.first).to eq(98_004_995) }

  specify { expect(subject.etag).to eq('"219ff041bb74f09759e6d8d05eb19fc530b44eb383271948eeb9e255"') }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("331a1fa4-78cb-46dd-999e-11852955a933") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(43) }
end
