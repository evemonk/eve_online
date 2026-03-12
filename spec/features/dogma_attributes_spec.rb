# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get attributes" do
  before { VCR.insert_cassette "esi/dogma/attributes" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.dogma.attributes }

  specify { expect(subject.attribute_ids.size).to eq(2_825) }

  specify { expect(subject.attribute_ids.first).to eq(1_413) }

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("9744cc2e-f955-47d3-b9a5-4b3aef360988") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(19) }
end
