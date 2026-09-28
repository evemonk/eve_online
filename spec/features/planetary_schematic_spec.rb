# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get schematic information" do
  before { VCR.insert_cassette "esi/planetary_interaction/schematics/65" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.planetary_interaction.schematic(id: 65) }

  specify { expect(subject.as_json).to eq(cycle_time: 3600, schematic_name: "Superconductors") }

  specify { expect(subject.etag).to eq("\"6b36271ceae47381963abbecb6ce8b16f4aa5cefa82386a92899126b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("bdbc8a15-ad09-4f5c-80ca-eb4018414623") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(36) }
end
