# frozen_string_literal: true

require 'spec_helper'

describe 'Get alliance icon' do
  let(:options) { { alliance_id: 99_005_443 } }

  before { VCR.insert_cassette 'esi/alliance_icon/99005443' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::AllianceIcon.new(options) }

  specify { expect(subject.scope).to eq(nil) }

  specify do
    expect(subject.as_json).to eq(icon_medium: 'http://image.eveonline.com/Alliance/99005443_128.png',
                                  icon_small: 'http://image.eveonline.com/Alliance/99005443_64.png')
  end
end
