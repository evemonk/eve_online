# frozen_string_literal: true

require 'spec_helper'

describe 'List wars' do
  before { VCR.insert_cassette 'esi/wars' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Wars.new }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.wars_ids.size).to eq(2000) }

  specify { expect(subject.wars_ids.first).to eq(615_639) }
end
