# frozen_string_literal: true

require "spec_helper"

describe "List all alliances" do
  before { VCR.insert_cassette "esi/alliances/alliances" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Alliances.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.alliance_ids.size).to eq(3439) }

  specify { expect(subject.alliance_ids.first).to eq(99_000_006) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(2) }
end
