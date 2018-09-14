# frozen_string_literal: true

require 'spec_helper'

describe 'List kills for a war' do
  let(:options) { { war_id: 615_578 } }

  before { VCR.insert_cassette 'esi/war/615578' }

  after { VCR.eject_cassette }

  subject { EveOnline::ESI::WarKillmails.new(options) }

  specify { expect(subject.page).to eq(1) }

  specify { expect(subject.total_pages).to eq(1) }

  specify { expect(subject.killmails.size).to eq(1) }

  specify do
    expect(subject.killmails.first.as_json).to eq(killmail_hash: '07f7ef1d7f6090e78d8e85b4a98e680f67b5e9d5',
                                                  killmail_id: 72_410_059)
  end
end
