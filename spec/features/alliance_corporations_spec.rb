# frozen_string_literal: true

require "spec_helper"

describe "List alliance's corporations" do
  let(:options) { {alliance_id: 99_008_595} }

  before { VCR.insert_cassette "esi/alliance_corporations/99008595" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::AllianceCorporations.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.corporation_ids.size).to eq(5) }

  specify { expect(subject.corporation_ids.first).to eq(98_565_696) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(3) }
end
