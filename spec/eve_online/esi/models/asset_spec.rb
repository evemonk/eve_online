# frozen_string_literal: true

require 'spec_helper'

describe EveOnline::ESI::Models::Asset do
  let(:options) { double }

  subject { described_class.new(options) }

  it { should be_a(EveOnline::ESI::Models::Base) }

  describe '#initialize' do
    its(:options) { should eq(options) }
  end

  describe '#as_json' do
    let(:assets) { described_class.new(options) }

    before { expect(assets).to receive(:type_id).and_return(2629) }

    before { expect(assets).to receive(:quantity).and_return(16_156) }

    before { expect(assets).to receive(:location_id).and_return(60_008_674) }

    before { expect(assets).to receive(:location_type).and_return('station') }

    before { expect(assets).to receive(:item_id).and_return(1_006_604_012_678) }

    before { expect(assets).to receive(:location_flag).and_return('Hangar') }

    before { expect(assets).to receive(:is_singleton).and_return(false) }

    subject { assets.as_json }

    its([:type_id]) { should eq(2629) }

    its([:quantity]) { should eq(16_156) }

    its([:location_id]) { should eq(60_008_674) }

    its([:location_type]) { should eq('station') }

    its([:item_id]) { should eq(1_006_604_012_678) }

    its([:location_flag]) { should eq('Hangar') }

    its([:is_singleton]) { should eq(false) }
  end

  describe '#type_id' do
    before { expect(options).to receive(:[]).with('type_id') }

    specify { expect { subject.type_id }.not_to raise_error }
  end

  describe '#quantity' do
    before { expect(options).to receive(:[]).with('quantity') }

    specify { expect { subject.quantity }.not_to raise_error }
  end

  describe '#location_id' do
    before { expect(options).to receive(:[]).with('location_id') }

    specify { expect { subject.location_id }.not_to raise_error }
  end

  describe '#location_type' do
    before { expect(options).to receive(:[]).with('location_type') }

    specify { expect { subject.location_type }.not_to raise_error }
  end

  describe '#item_id' do
    before { expect(options).to receive(:[]).with('item_id') }

    specify { expect { subject.item_id }.not_to raise_error }
  end

  describe '#location_flag' do
    before { expect(options).to receive(:[]).with('location_flag') }

    specify { expect { subject.location_flag }.not_to raise_error }
  end

  describe '#is_singleton' do
    before { expect(options).to receive(:[]).with('is_singleton') }

    specify { expect { subject.is_singleton }.not_to raise_error }
  end
end
