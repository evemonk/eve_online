# frozen_string_literal: true

require "spec_helper"

describe "Get character online" do
  context "when etag not set" do
    before { VCR.insert_cassette "esi/location/online" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        character_id: 90_729_314,
        token: "token123",
      }
    end

    subject { EveOnline::ESI::CharacterOnline.new(options) }

    specify { expect(subject.not_modified?).to eq(false) }

    specify { expect(subject.scope).to eq("esi-location.read_online.v1") }

    specify do
      expect(subject.as_json).to eq(last_login: "2017-01-15 11:39:24",
                                    last_logout: "2017-01-15 11:31:22",
                                    logins: 370,
                                    online: false)
    end

    specify { expect(subject.etag).to eq("43c82cdefedc4275da30d7731200df96b905dc94b8486d55bedb5fe6") }
  end

  context "when etag is set" do
    before { VCR.insert_cassette "esi/location/online_with_etag" }

    after { VCR.eject_cassette }

    let(:options) do
      {
        character_id: 90_729_314,
        token: "token123",
        etag: "43c82cdefedc4275da30d7731200df96b905dc94b8486d55bedb5fe6",
      }
    end

    subject { EveOnline::ESI::CharacterOnline.new(options) }

    specify { expect(subject.not_modified?).to eq(true) }

    specify { expect(subject.etag).to eq("43c82cdefedc4275da30d7731200df96b905dc94b8486d55bedb5fe6") }
  end
end
