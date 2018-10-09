# frozen_string_literal: true

require 'spec_helper'

describe "List alliance's corporations" do
  let(:options) { { alliance_id: 99_005_443 } }

  before { VCR.insert_cassette 'esi/alliance_corporations/99005443' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::AllianceCorporations.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify { expect(subject.corporation_ids.size).to eq(67) }

  specify { expect(subject.corporation_ids.first).to eq(98_134_807) }
end
