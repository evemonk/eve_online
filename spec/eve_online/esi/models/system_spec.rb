# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::System do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:system) { described_class.new(options) }

    before { expect(system).to receive(:constellation_id).and_return(20_000_001) }

    before { expect(system).to receive(:name).and_return('Tanoo') }

    before { expect(system).to receive(:security_class).and_return('B') }

    before { expect(system).to receive(:security_status).and_return(0.8583240509033203) }

    before { expect(system).to receive(:star_id).and_return(40_000_001) }

    before { expect(system).to receive(:system_id).and_return(30_000_001) }

    subject { system.as_json }

    its([:constellation_id]) { should eq(20_000_001) }

    its([:name]) { should eq('Tanoo') }

    its([:security_class]) { should eq('B') }

    its([:security_status]) { should eq(0.8583240509033203) }

    its([:star_id]) { should eq(40_000_001) }

    its([:system_id]) { should eq(30_000_001) }
  end

  describe '#constellation_id' do
    before { expect(options).to receive(:[]).with('constellation_id') }

    specify { expect { subject.constellation_id }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#security_class' do
    before { expect(options).to receive(:[]).with('security_class') }

    specify { expect { subject.security_class }.not_to raise_error }
  end

  describe '#security_status' do
    before { expect(options).to receive(:[]).with('security_status') }

    specify { expect { subject.security_status }.not_to raise_error }
  end

  describe '#star_id' do
    before { expect(options).to receive(:[]).with('star_id') }

    specify { expect { subject.star_id }.not_to raise_error }
  end

  describe '#system_id' do
    before { expect(options).to receive(:[]).with('system_id') }

    specify { expect { subject.system_id }.not_to raise_error }
  end

  describe '#position' do
    specify { expect(subject.position).to eq(nil) }
  end

  describe '#planets' do
    specify { expect(subject.planets).to eq(nil) }
  end

  describe '#stargate_ids' do
    specify { expect(subject.stargate_ids).to eq(nil) }
  end

  describe '#station_ids' do
    specify { expect(subject.station_ids).to eq(nil) }
  end
end
