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

  specify { expect(subject.etag).to eq("\"913b3f4e2ed35371bed5a2ddb54a29f6451d6062f85c3490634a33b0\"") }

  specify { expect(subject.cache_status).to eq("MISS") }

  specify { expect(subject.request_id).to eq("aff002fd-843c-4a44-90de-6029296789ab") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(38) }
end
