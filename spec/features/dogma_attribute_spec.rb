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

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("25d978dd-d838-4852-9863-66db9e02e602") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(17) }
end
