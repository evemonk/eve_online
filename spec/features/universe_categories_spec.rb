# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get item categories" do
  before { VCR.insert_cassette "esi/universe/categories" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.categories }

  specify { expect(subject.category_ids.size).to eq(48) }

  specify { expect(subject.category_ids.first).to eq(0) }

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("fd2957d2-75c0-4366-9003-d053139634b3") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(40) }
end
