# frozen_string_literal: true

require 'spec_helper'

describe 'List all alliances' do
  before { VCR.insert_cassette 'esi/alliances' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Alliances.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.alliance_ids.size).to eq(3024) }

  specify { expect(subject.alliance_ids.first).to eq(1_354_830_081) }
end
