# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get changelog" do
  before { VCR.insert_cassette "esi/meta/changelog" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.meta.changelog }

  specify { expect(subject.as_json[:changelog]).to be_a(Hash) }

  specify { expect(subject.as_json[:changelog]["2020-01-01"]).to be_an(Array) }

  specify do
    expect(subject.as_json[:changelog]["2020-01-01"].first).to eq("method" => "GET",
      "path" => "/meta/changelog",
      "compatibility_date" => "2020-01-01",
      "type" => "new",
      "description" => "Initial release of changelog.")
  end

  specify { expect(subject.etag).to eq(nil) }

  specify { expect(subject.cache_status).to eq(nil) }

  specify { expect(subject.request_id).to eq(nil) }

  specify { expect(subject.ratelimit_group).to eq("meta") }

  specify { expect(subject.ratelimit_limit).to eq("150/15m") }

  specify { expect(subject.ratelimit_remaining).to eq(133) }

  specify { expect(subject.ratelimit_used).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(nil) }

  specify { expect(subject.error_limit_reset).to eq(nil) }
end
