# frozen_string_literal: true

require "spec_helper"

describe "Get contracts" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: "token123",
      page: 1
    }
  end

  before { VCR.insert_cassette "esi/character_contracts/1337512245" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterContracts.new(options) }

  specify { expect(subject.scope).to eq("esi-contracts.read_character_contracts.v1") }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.contracts.size).to eq(3) }

  specify do
    expect(subject.contracts.first.as_json).to eq(acceptor_id: 2_116_199_184,
      assignee_id: 2_116_199_184,
      availability: "personal",
      buyout: nil,
      collateral: 0.0,
      contract_id: 154837125,
      date_accepted: "2020-03-06T21:09:32Z",
      date_completed: "2020-03-06T21:09:32Z",
      date_expired: "2020-03-07T21:09:11Z",
      date_issued: "2020-03-06T21:09:11Z",
      days_to_complete: 0,
      end_location_id: 60008674,
      for_corporation: false,
      issuer_corporation_id: 98134807,
      issuer_id: 1337512245,
      price: 0.0,
      reward: 0.0,
      start_location_id: 60008674,
      status: "finished",
      title: "",
      type: "item_exchange",
      volume: 15000.0)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(12) }
end
