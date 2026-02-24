# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get active implants" do
  before { VCR.insert_cassette "esi/character_implants/1337512245" }

  after { VCR.eject_cassette }
end
