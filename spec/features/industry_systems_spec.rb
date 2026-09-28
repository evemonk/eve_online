# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get industry systems" do
  before { VCR.insert_cassette "esi/industry/systems" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.industry.systems }

  specify { expect(subject.size).to eq(5485) }

  specify { expect(subject.first.as_json).to eq(solar_system_id: 30_020_141) }

  specify { expect(subject.first.cost_indices.size).to eq(6) }

  specify { expect(subject.first.cost_indices.first.as_json).to eq(activity: "manufacturing", cost_index: 0.0014) }

  specify { expect(subject.etag).to eq("\"93957f0b6ee12d2a38caba26cf9e91a31623aec26e03bd088dfcca2d\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("5e87dddc-414f-408f-8b86-4b99839a412e") }

  specify { expect(subject.ratelimit_group).to eq("industry") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(142) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
