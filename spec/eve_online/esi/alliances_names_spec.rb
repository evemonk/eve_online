# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::AlliancesNames do
  let(:options) { { alliance_ids: [99_005_443] } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/alliances/names/?alliance_ids=%<alliance_ids>s&datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:alliance_ids) { should eq([99_005_443]) }
  end

  describe '#alliances' do
    let(:alliance) { double }

    let(:response) do
      [
        {
          'alliance_id' => 99_005_443,
          'alliance_name' => 'Kids With Guns Alliance'
        }
      ]
    end

    before do
      #
      # subject.response # => [{"alliance_id"=>99005443, "alliance_name"=>"Kids With Guns Alliance"}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::AllianceShort.new(response.first) # => alliance
      #
      expect(EveOnline::ESI::Models::AllianceShort).to receive(:new).with(response.first).and_return(alliance)
    end

    specify { expect(subject.alliances).to eq([alliance]) }

    specify { expect { subject.alliances }.to change { subject.instance_variable_defined?(:@_memoized_alliances) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    context 'when alliance_ids contains one element' do
      specify do
        expect(subject.url).to eq('https://esi.tech.ccp.is/v2/alliances/names/?alliance_ids=99005443&datasource=tranquility')
      end
    end

    context 'when alliance_ids contains several elements' do
      let(:options) { { alliance_ids: [99_005_443, 99_005_443] } }

      specify do
        expect(subject.url).to eq('https://esi.tech.ccp.is/v2/alliances/names/?alliance_ids=99005443,99005443&datasource=tranquility')
      end
    end
  end
end
