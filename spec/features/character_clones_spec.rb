# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Get clones" do
  before { VCR.insert_cassette "esi/character_clones/1337512245" }

  after { VCR.eject_cassette }
end
