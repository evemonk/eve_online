# frozen_string_literal: true

require "spec_helper"

describe "Get public contract items" do
  before { VCR.insert_cassette "esi/public_contract/157872948" }

  after { VCR.eject_cassette }

  let(:options) { {contract_id: 157_872_948, page: 1} }

  subject { EveOnline::ESI::PublicContract.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.items.size).to eq(1) }

  specify do
    expect(subject.items.first.as_json).to eq(is_blueprint_copy: true,
      is_included: true,
      item_id: 1_029_552_558_074,
      material_efficiency: 10,
      quantity: 1,
      record_id: 3_210_378_611,
      runs: 400,
      time_efficiency: 20,
      type_id: 29_040)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(51) }
end
