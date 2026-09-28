# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get attribute information" do
  before { VCR.insert_cassette "esi/dogma/attributes/2" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.dogma.attribute(id: 2) }

  specify do
    expect(subject.as_json).to eq(attribute_id: 2,
      default_value: 0.0,
      description: "Boolean to store status of online effect",
      display_name: "",
      high_is_good: true,
      icon_id: nil,
      name: "isOnline",
      published: nil,
      stackable: true,
      unit_id: nil)
  end

  specify { expect(subject.etag).to eq("W/\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("0acd5dad-3818-42f9-84c2-c7a439b132f6") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(44) }
end
