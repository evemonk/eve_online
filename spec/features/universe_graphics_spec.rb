# frozen_string_literal: true

require 'spec_helper'

describe 'Get graphics' do
  before { VCR.insert_cassette 'esi/universe/graphics' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseGraphics.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.graphic_ids.size).to eq(3624) }

  specify { expect(subject.graphic_ids.first).to eq(20_481) }
end
