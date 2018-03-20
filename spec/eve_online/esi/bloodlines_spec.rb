# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Bloodlines do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v1/universe/bloodlines/?datasource=tranquility&language=en-us') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }
  end

  describe '#bloodlines' do
    let(:bloodline) { double }

    let(:response) do
      [
        {
          'bloodline_id' => 4,
          'name' => 'Brutor',
          'description' => 'A martial, strong-willed people, the Brutor...',
          'race_id' => 2,
          'ship_type_id' => 588,
          'corporation_id' => 1_000_049,
          'perception' => 9,
          'willpower' => 7,
          'charisma' => 6,
          'memory' => 4,
          'intelligence' => 4
        }
      ]
    end

    before do
      #
      # subject.response # => [{"bloodline_id"=>4, "name"=>"Brutor", "description"=>"A martial, strong-willed people, the Brutor...", "race_id"=>2, "ship_type_id"=>588, "corporation_id"=>1000049, "perception"=>9, "willpower"=>7, "charisma"=>6, "memory"=>4, "intelligence"=>4}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::Bloodline.new(response.first) # => bloodline
      #
      expect(EveOnline::ESI::Models::Bloodline).to receive(:new).with(response.first).and_return(bloodline)
    end

    specify { expect(subject.bloodlines).to eq([bloodline]) }

    specify { expect { subject.bloodlines }.to change { subject.instance_variable_defined?(:@_memoized_bloodlines) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v1/universe/bloodlines/?datasource=tranquility&language=en-us')
    end
  end
end
