# frozen_string_literal: true

require 'spec_helper'

describe "Get character's public information" do
  let(:options) { { character_id: 1_337_512_245 } }

  before { VCR.insert_cassette 'esi/characters/1337512245' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::Character.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(corporation_id: 98_134_807,
                                  birthday: '2010-01-15T15:26:00Z',
                                  name: 'Johnn Dillinger',
                                  gender: 'male',
                                  race_id: 2,
                                  bloodline_id: 4,
                                  description: '',
                                  alliance_id: 99_005_443,
                                  ancestry_id: 24,
                                  security_status: 1.8694881661345457,
                                  faction_id: nil)
  end
end
