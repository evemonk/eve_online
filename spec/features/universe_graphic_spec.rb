# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get graphic information" do
  before { VCR.insert_cassette "esi/universe/graphics/20481" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.graphic(id: 20_481) }

  specify do
    expect(subject.as_json).to eq(collision_file: nil,
      graphic_file: nil,
      graphic_id: 20_481,
      icon_folder: nil,
      sof_dna: "ai1_t1:tash-murkon:amarr",
      sof_fation_name: "tash-murkon",
      sof_hull_name: "ai1_t1",
      sof_race_name: "amarr")
  end

  specify { expect(subject.etag).to eq("W/\"eb02b32cba3ed2b28639d4d552243949671a18d2b8aca54f4271cfbb\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("f5830882-1403-48e4-9a49-66c26dcd1ac9") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(6) }
end
