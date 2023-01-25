# frozen_string_literal: true

require "spec_helper"

describe "Get a single killmail" do
  let(:options) do
    {
      killmail_id: 81_646_519,
      killmail_hash: "8f1450fca8ce97be9b10e106a1257088407ef387"
    }
  end

  before { VCR.insert_cassette "esi/killmail/81646519/8f1450fca8ce97be9b10e106a1257088407ef387" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Killmail.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq({})
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(48) }
end
