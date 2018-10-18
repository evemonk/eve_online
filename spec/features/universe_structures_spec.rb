# frozen_string_literal: true

require 'spec_helper'

describe 'List all public structures' do
  before { VCR.insert_cassette 'esi/universe/structures' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::UniverseStructures.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.structure_ids.size).to eq(4181) }

  specify { expect(subject.structure_ids.first).to eq(1_028_178_624_512) }
end
