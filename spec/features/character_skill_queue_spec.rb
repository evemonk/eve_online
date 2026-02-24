# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character's skill queue" do
  before { VCR.insert_cassette "esi/character_skill_queue/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.skills.skillqueue(character_id: 1_337_512_245) }

  specify { expect(subject.size).to eq(5) }

  specify do
    expect(subject.first.as_json).to eq(
      finish_date: nil,
      finished_level: 5,
      level_end_sp: 768_000,
      level_start_sp: 135_765,
      queue_position: 2,
      skill_id: 26_253,
      start_date: nil,
      training_start_sp: 439_295
    )
  end

  specify { expect(subject.etag).to eq("W/\"1d3a055674a2cda812061a85306501de9a6dc930accd48d00cb94e97cf253051\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("char-detail") }

  specify { expect(subject.ratelimit_limit).to eq("600/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(597) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
