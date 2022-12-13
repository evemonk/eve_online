# frozen_string_literal: true

require "spec_helper"

describe "Get solar systems" do
  before { VCR.insert_cassette "esi/universe/systems" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseSystems.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.universe_system_ids.size).to eq(8285) }

  specify { expect(subject.universe_system_ids.first).to eq(30_000_001) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(1) }
end
