# frozen_string_literal: true

require "spec_helper"

describe "Get character online" do
  before { VCR.insert_cassette "esi/location/online" }

  after { VCR.eject_cassette }

  let(:options) do
    {
      character_id: 90_729_314,
      token: "token123"
    }
  end

  subject { EveOnline::ESI::CharacterOnline.new(options) }

  specify { expect(subject.scope).to eq("esi-location.read_online.v1") }

  specify do
    expect(subject.as_json).to eq(last_login: "2017-01-15 11:39:24",
      last_logout: "2017-01-15 11:31:22",
      logins: 370,
      online: false)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(49) }
end
