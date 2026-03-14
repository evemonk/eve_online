# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get character notifications" do
  before { VCR.insert_cassette "esi/character_notifications/1337512245" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new(token: "token123") }

  subject { client.characters.notifications(id: 1_337_512_245) }

  specify { expect(subject.size).to eq(219) }

  specify do
    expect(subject.first.as_json).to eq(is_read: nil,
      notification_id: 2_156_021_212,
      sender_id: 319_898_237,
      sender_type: "character",
      text: "corpID: 98565696\n",
      timestamp: Time.utc(2025, 4, 24, 19, 2, 0),
      type: "CorpKicked")
  end

  specify { expect(subject.etag).to eq("\"2c292b46a5600f3d99893a75a5387a150666c182a27f886abd96658c\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("b95088fb-89a5-4879-8b0b-e9aec6d06181") }

  specify { expect(subject.ratelimit_group).to eq("char-notification") }

  specify { expect(subject.ratelimit_limit).to eq("15/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(11) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
