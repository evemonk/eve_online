# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get public contract items" do
  before { VCR.insert_cassette "esi/contracts/public/items/235554525" }

  after { VCR.eject_cassette }

  let(:client) { EveOnline::ESI::Client.new }

  subject { client.contracts.public_items(contract_id: 235_554_525) }

  specify { expect(subject.size).to eq(1) }

  specify do
    expect(subject.first.as_json).to eq(is_blueprint_copy: true,
      is_included: true,
      item_id: 1_047_092_007_473,
      material_efficiency: 5,
      quantity: 1,
      record_id: 5_302_078_925,
      runs: 1,
      time_efficiency: 10,
      type_id: 77_416)
  end
end
