# frozen_string_literal: true

require "spec_helper"

describe "Get alliance icon" do
  let(:options) { {alliance_id: 99_008_595} }

  before { VCR.insert_cassette "esi/alliance_icon/99008595" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::AllianceIcon.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(icon_medium: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=128",
      icon_small: "https://images.evetech.net/alliances/99008595/logo?tenant=tranquility&size=64")
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(10) }
end
