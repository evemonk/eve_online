# frozen_string_literal: true

require 'spec_helper'

describe "Get character assets" do
  let(:options) do
    {
      character_id: 1_337_512_245,
      token: 'token123',
      page: 1
    }
  end

  before { VCR.insert_cassette 'esi/character_assets/1337512245' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::CharacterAssets.new(options) }

  specify { expect(subject.assets.size).to eq(487) }

  specify do
    expect(subject.assets.first.as_json).to eq(is_blueprint_copy: nil,
                                               is_singleton: false,
                                               item_id: 163_730_877,
                                               location_flag: 'Hangar',
                                               location_id: 60_003_853,
                                               location_type: 'station',
                                               quantity: 1,
                                               type_id: 6296)
  end
end
