# frozen_string_literal: true

require 'spec_helper'

describe 'Get effects' do
  before { VCR.insert_cassette 'esi/dogma/effects' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::DogmaEffects.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.effects_ids.size).to eq(4123) }

  specify { expect(subject.effects_ids.first).to eq(4) }
end
