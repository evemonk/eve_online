require 'spec_helper'

describe EveOnline::ESI::CharacterClones do
  let(:options) { { token: 'token123', character_id: 12_345_678 } }

  subject { described_class.new(options) }

  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.tech.ccp.is/v2/characters/%s/clones/?datasource=tranquility') }

  describe '#initialize' do
    its(:token) { should eq('token123') }

    its(:parser) { should eq(JSON) }

    its(:character_id) { should eq(12_345_678) }
  end

  describe '#jump_clones' do
    let(:jump_clone) { double }

    let(:response) do
      [
        {
          'location_id' => 61_000_032,
          'location_type' => 'station',
          'implants' => [22_118]
        }
      ]
    end

    before do
      #
      # subject.response['jump_clones'] # => [{"location_id"=>61000032, "location_type"=>"station", "implants"=>[22118]}]
      #
      expect(subject).to receive(:response) do
        double.tap do |a|
          expect(a).to receive(:[]).with('jump_clones').and_return(response)
        end
      end
    end

    before do
      #
      # EveOnline::ESI::Models::JumpClone.new(response.first) # => jump_clone
      #
      expect(EveOnline::ESI::Models::JumpClone).to receive(:new).with(response.first).and_return(jump_clone)
    end

    specify { expect(subject.jump_clones).to eq([jump_clone]) }

    specify { expect { subject.jump_clones }.to change { subject.instance_variable_defined?(:@_memoized_jump_clones) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq('esi-clones.read_clones.v1') }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.tech.ccp.is/v2/characters/12345678/clones/?datasource=tranquility')
    end
  end
end
