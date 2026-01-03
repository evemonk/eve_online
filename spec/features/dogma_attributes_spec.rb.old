# frozen_string_literal: true

require "spec_helper"

describe "Get attributes" do
  before { VCR.insert_cassette "esi/dogma/attributes" }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::DogmaAttributes.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.attribute_ids.size).to eq(2463) }

  specify { expect(subject.attribute_ids.first).to eq(2) }

  specify { expect(subject.error_limit_remain).to eq(100) }

  specify { expect(subject.error_limit_reset).to eq(37) }
end
