# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::Constellation do
  it { should be_a(EveOnline::ESI::Models::Base) }

  let(:options) { double }

  subject { described_class.new(options) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:constellation) { described_class.new(options) }

    before { expect(constellation).to receive(:constellation_id).and_return(20_000_001) }

    before { expect(constellation).to receive(:name).and_return('San Matar') }

    before { expect(constellation).to receive(:region_id).and_return(10_000_001) }

    before { expect(constellation).to receive(:systems).and_return([30_000_001]) }

    subject { constellation.as_json }

    its([:constellation_id]) { should eq(20_000_001) }

    its([:name]) { should eq('San Matar') }

    its([:region_id]) { should eq(10_000_001) }

    its([:systems]) { should eq([30_000_001]) }
  end

  describe '#constellation_id' do
    before { expect(options).to receive(:[]).with('constellation_id') }

    specify { expect { subject.constellation_id }.not_to raise_error }
  end

  describe '#name' do
    before { expect(options).to receive(:[]).with('name') }

    specify { expect { subject.name }.not_to raise_error }
  end

  describe '#region_id' do
    before { expect(options).to receive(:[]).with('region_id') }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe '#systems' do
    before { expect(options).to receive(:[]).with('systems') }

    specify { expect { subject.systems }.not_to raise_error }
  end

  describe '#position' do
    # TODO: write
  end
end
