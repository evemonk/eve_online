# frozen_string_literal: true

require "spec_helper"

describe "List wars" do
  context "without max_war_id" do
    before { VCR.insert_cassette "esi/wars/wars" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Wars.new }

    specify { expect(subject.scope).to eq(nil) }

    specify { expect(subject.war_ids.size).to eq(2000) }

    specify { expect(subject.war_ids.first).to eq(629_019) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(14) }
  end

  context "with max_war_id" do
    before { VCR.insert_cassette "esi/wars/wars_with_max_war_id" }

    after { VCR.eject_cassette }

    subject { EveOnline::ESI::Wars.new(max_war_id: 10) }

    specify { expect(subject.war_ids.size).to eq(9) }

    specify { expect(subject.war_ids.first).to eq(9) }

    specify { expect(subject.error_limit_remain).to eq(100) }

    specify { expect(subject.error_limit_reset).to eq(56) }
  end
end
