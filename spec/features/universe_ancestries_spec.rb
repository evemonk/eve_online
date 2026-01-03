# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get ancestries" do
  before { VCR.insert_cassette "esi/universe/ancestries" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.universe.ancestries }

  specify { expect(subject.size).to eq(43) }

  specify do
    expect(subject.first.as_json).to eq(id: 13,
      bloodline_id: 7,
      description: "The Gallente prize political activism more so than other Empires. Many devote their efforts towards one or more causes that suit their ambitions. Activists understand that things will never change for the better unless someone has the courage to fight the good fight.",
      icon_id: 1653,
      name: "Activists",
      short_description: "Making the universe a better place, one fight at a time.")
  end

  specify { expect(subject.etag).to eq("W/\"d53e06315fe6f15f4dd47da86f16b3cb51977abc22701227d931f03b\"") }

  specify { expect(subject.cache_status).to eq("HIT") }

  specify { expect(subject.request_id).to eq("cdf469b4-b219-44f5-8229-10ecc10c40fe") }

  specify { expect(subject.ratelimit_group).to eq(nil) }

  specify { expect(subject.ratelimit_limit).to eq(nil) }

  specify { expect(subject.ratelimit_remaining).to eq(nil) }

  specify { expect(subject.ratelimit_used).to eq(nil) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(3) }
end
