# frozen_string_literal: true

require 'spec_helper'

describe 'Get station information' do
  before { VCR.insert_cassette 'esi/universe/stargate/60012526' }

  after { VCR.eject_cassette }

  let(:options) { { id: 60012526 } }

  subject { EveOnline::ESI::UniverseStation.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(:max_dockable_ship_volume=>50000000.0,
                                  :name=>"Tanoo V - Moon 1 - Ammatar Consulate Bureau",
                                  :office_rental_cost => 422500.0,
                                  :owner => 1000126,
                                  :race_id => 2,
                                  :reprocessing_efficiency => 0.5,
                                  :reprocessing_stations_take => 0.05,
                                  :services => ["bounty-missions", "courier-missions", "interbus", "reprocessing-plant", "market", "stock-exchange", "cloning", "repair-facilities", "fitting", "news", "insurance", "docking", "office-rental", "loyalty-point-store", "navy-offices", "security-offices"],
                                  :station_id=>60012526,
                                  :system_id=>30000001,
                                  :type_id=>2502)
  end

  specify do
    expect(subject.position.as_json).to eq(:x=>-1106145239040.0,
                                           :y=>-145460060160.0,
                                           :z=>182618726400.0)
  end
end
