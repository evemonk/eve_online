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

    let(:position_x) { double }

    let(:position_y) { double }

    let(:position_z) { double }

    before { expect(constellation).to receive(:constellation_id).and_return(20_000_001) }

    before { expect(constellation).to receive(:name).and_return('San Matar') }

    before { expect(constellation).to receive(:position_x).and_return(position_x) }

    before { expect(constellation).to receive(:position_y).and_return(position_y) }

    before { expect(constellation).to receive(:position_z).and_return(position_z) }

    before { expect(constellation).to receive(:region_id).and_return(10_000_001) }

    before { expect(constellation).to receive(:systems).and_return([30_000_001]) }

    subject { constellation.as_json }

    its([:constellation_id]) { should eq(20_000_001) }

    its([:name]) { should eq('San Matar') }

    its([:position_x]) { should eq(position_x) }

    its([:position_y]) { should eq(position_y) }

    its([:position_z]) { should eq(position_z) }

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

  describe '#position_x' do
    context 'when position is present' do
      let(:position) { double }

      before { expect(options).to receive(:[]).with('position').and_return(position).twice }

      before do
        #
        # options['position']['x']
        #
        expect(position).to receive(:[]).with('x')
      end

      specify { expect { subject.position_x }.not_to raise_error }
    end

    context 'when position not present' do
      before { expect(options).to receive(:[]).with('position').and_return(nil) }

      specify { expect { subject.position_x }.not_to raise_error }
    end
  end

  describe '#position_y' do
    context 'when position is present' do
      let(:position) { double }

      before { expect(options).to receive(:[]).with('position').and_return(position).twice }

      before do
        #
        # options['position']['y']
        #
        expect(position).to receive(:[]).with('y')
      end

      specify { expect { subject.position_y }.not_to raise_error }
    end

    context 'when position not present' do
      before { expect(options).to receive(:[]).with('position').and_return(nil) }

      specify { expect { subject.position_y }.not_to raise_error }
    end
  end

  describe '#position_z' do
    context 'when position is present' do
      let(:position) { double }

      before { expect(options).to receive(:[]).with('position').and_return(position).twice }

      before do
        #
        # options['position']['z']
        #
        expect(position).to receive(:[]).with('z')
      end

      specify { expect { subject.position_z }.not_to raise_error }
    end

    context 'when position not present' do
      before { expect(options).to receive(:[]).with('position').and_return(nil) }

      specify { expect { subject.position_z }.not_to raise_error }
    end
  end

  describe '#region_id' do
    before { expect(options).to receive(:[]).with('region_id') }

    specify { expect { subject.region_id }.not_to raise_error }
  end

  describe '#systems' do
    before { expect(options).to receive(:[]).with('systems') }

    specify { expect { subject.systems }.not_to raise_error }
  end
end
