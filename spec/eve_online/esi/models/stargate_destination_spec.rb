# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::StargateDestination do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:stargate_destination) { described_class.new(options) }

    before { expect(stargate_destination).to receive(:stargate_id).and_return(50000342) }

    before { expect(stargate_destination).to receive(:system_id).and_return(30000003) }

    subject { stargate_destination.as_json }

    its([:stargate_id]) { should eq(50000342) }

    its([:system_id]) { should eq(30000003) }
  end

  describe '#stargate_id' do
    before { expect(options).to receive(:[]).with('stargate_id') }

    specify { expect { subject.stargate_id }.not_to raise_error }
  end

  describe '#system_id' do
    before { expect(options).to receive(:[]).with('system_id') }

    specify { expect { subject.system_id }.not_to raise_error }
  end
end
