# frozen_string_literal: true

require 'spec_helper'

describe 'Get stargate information' do
  before { VCR.insert_cassette 'esi/universe/stargate/50000056' }

  after { VCR.eject_cassette }

  let(:options) { { id: 50000056 } }

  subject { EveOnline::ESI::UniverseStargate.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(:name=>"Stargate (Akpivem)",
                                  :stargate_id=>50000056,
                                  :system_id=>30000001,
                                  :type_id=>29624)
  end

  specify do
    expect(subject.destination.as_json).to eq(:stargate_id=>50000342,
                                              :system_id=>30000003)
  end

  specify do
    expect(subject.position.as_json).to eq(:x=>331516354560.0,
                                           :y=>43597455360.0,
                                           :z=>-586353991680.0)
  end
end
