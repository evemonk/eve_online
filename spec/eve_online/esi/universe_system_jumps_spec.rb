# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::UniverseSystemJumps do
  specify { expect(subject).to be_a(EveOnline::ESI::Base) }

  specify { expect(described_class::API_ENDPOINT).to eq('https://esi.evetech.net/v1/universe/system_jumps/?datasource=%<datasource>s') }

  describe '#initialize' do
    its(:token) { should eq(nil) }

    its(:parser) { should eq(JSON) }

    its(:_read_timeout) { should eq(60) }

    its(:_open_timeout) { should eq(60) }

    its(:datasource) { should eq('tranquility') }
  end

  describe '#system_jumps' do
    let(:system_jump) { instance_double(EveOnline::ESI::Models::SystemJump) }

    let(:response) do
      [
        {
          ship_jumps: 22,
          system_id: 30_005_327
        }
      ]
    end

    before do
      #
      # subject.response # => [{"ship_jumps"=>22, "system_id"=>30005327}]
      #
      expect(subject).to receive(:response).and_return(response)
    end

    before do
      #
      # EveOnline::ESI::Models::SystemJump.new(response.first) # => system_jump
      #
      expect(EveOnline::ESI::Models::SystemJump).to receive(:new).with(response.first).and_return(system_jump)
    end

    specify { expect(subject.system_jumps).to eq([system_jump]) }

    specify { expect { subject.system_jumps }.to change { subject.instance_variable_defined?(:@_memoized_system_jumps) }.from(false).to(true) }
  end

  describe '#scope' do
    specify { expect(subject.scope).to eq(nil) }
  end

  describe '#url' do
    specify do
      expect(subject.url).to eq('https://esi.evetech.net/v1/universe/system_jumps/?datasource=tranquility')
    end
  end
end
