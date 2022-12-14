# frozen_string_literal: true

require "spec_helper"

describe "Get attribute information" do
  before { VCR.insert_cassette "esi/dogma/attributes/2" }

  after { VCR.eject_cassette }

  let(:options) { {id: 2} }

  subject { EveOnline::ESI::DogmaAttribute.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(attribute_id: 2,
      default_value: 0.0,
      description: "Boolean to store status of online effect",
      display_name: "",
      high_is_good: true,
      icon_id: nil,
      name: "isOnline",
      published: nil,
      stackable: true,
      unit_id: nil)
  end

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(19) }
end
